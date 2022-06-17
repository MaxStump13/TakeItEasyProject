//
//  SQLite.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/17/22.
//

import Foundation
import SQLite3
class Sqlite {
    static var dbObj = Sqlite()
    var Questions = [QuizDB]()
    var Result = [QuizResults]()
    
    var questPointer : OpaquePointer?
    var resPointer : OpaquePointer?
    
    func createDB() {
            let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("QuizDB.sqlite") // creates file path for db
            
            if sqlite3_open(filePath.path, &questPointer) != SQLITE_OK {
                print("Error creating")
            }
        }
        
        // create table
        let sqlStmt = "create table if not exists quizzes (id integer primary key autoincrement, name text)"
        
        func createTable() {
            if sqlite3_exec(questPointer, sqlStmt, nil, nil, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error in table creation ")
            }
        }
        
        // create results table
        let sqlStmt2 = "create table if not exists results (id integer primary key autoincrement, name text, date text, score integer)"
        
        func createResultsTable() {
            if sqlite3_exec(questPointer, sqlStmt2, nil, nil, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error in results table creation ")
            }
        }
        
        // insert data into quizzes table
        func insertData(name: NSString) {
            var stmt : OpaquePointer?
            let query = "insert data into quizzes (name) values(?)"
            
            if sqlite3_prepare(questPointer, query, -1, &stmt, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error in query ", err)
            }
            
            if sqlite3_bind_text(stmt, 1, name.utf8String, -1, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error saving name ", err)
                
            }
            
//            if sqlite3_bind_text(stmt, 2, image.utf8String, -1, nil) != SQLITE_OK {
//                let err = String(cString: sqlite3_errmsg(questPointer)!)
//                print("error in saving course ", err)
//
//            }
            
            if sqlite3_step(stmt) != SQLITE_DONE {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error creating table ", err)
            }
            
            print("data saved ")
        }
        
        // insert data into results table
        func insertResultData(name: NSString, score: NSNumber, date: NSString) {
            var stmt : OpaquePointer?
            let query = "insert results into results (name, score, date) values (?,?,?)"
            
            if sqlite3_prepare(questPointer, query, -1, &stmt, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error in query ", err)
                return
            }
            
            if sqlite3_bind_text(stmt, 1, name.utf8String, -1, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error saving name ", err)
                return
                
            }
            if sqlite3_bind_int(stmt, 2, Int32(truncating: score)) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error saving score ", err)
                return
            }
            
            if sqlite3_bind_text(stmt, 3, date.utf8String, -1, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error saving date ", err)
                return
                
            }
            
            if sqlite3_step(stmt) != SQLITE_DONE {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error in results table creation ", err)
                return
            }
            
            print("result data saved ")
        }
        
        
        
        func insertAllData(quizData: [QuizDB]) {
            var stmt : OpaquePointer?
            let query = "insert into quizzes (name) values (?)"
            
            
            
            print("Count: ", quizData.count)
            
            if sqlite3_prepare(questPointer, query, -1, &stmt, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error in query creation ", err)
            }
            
            for (index, quiz) in quizData.enumerated() {
                
                // prepare id
                //            let id = Int32(index + 1)
                //            if sqlite3_bind_int(stmt, 0, id) != SQLITE_OK {
                //                let err = String(cString: sqlite3_errmsg(dbpointer)!)
                //                print("error in saving id ", err)
                //
                //            }
                
                // prepare quiz name
                let qName : NSString = quiz.name as NSString
                if sqlite3_bind_text(stmt, 1, qName.utf8String, -1, nil) != SQLITE_OK {
                    let err = String(cString: sqlite3_errmsg(questPointer)!)
                    print("error in saving name ", err)
                    
                }
                
                // prepare quiz image
//                let qImage : NSString = quiz.image as NSString
//                if sqlite3_bind_text(stmt, 2, qImage.utf8String, -1, nil) != SQLITE_OK {
//
//                    let err = String(cString: sqlite3_errmsg(dbpointer)!)
//                    print("error in saving image ", err)
//
//                }
                
                if sqlite3_step(stmt) != SQLITE_DONE {
                    let err = String(cString: sqlite3_errmsg(questPointer)!)
                    print("error in table creation ", err)
                }
                
                
                print("data saved ")
            }
            
        }
        
        
        func getData() -> [QuizDB] {
            Questions.removeAll()
            let query = "select * from quizzes"
            var stmt : OpaquePointer?
            
            if sqlite3_prepare(questPointer, query, -1, &stmt, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error in table creation ", err)
                return Questions
            }
            
            while(sqlite3_step(stmt) == SQLITE_ROW) {
                let id = sqlite3_column_int(stmt, 0)
                let name = String(cString: sqlite3_column_text(stmt, 1))
                
                Questions.append(QuizDB(id: Int(id), name: name))
            }
            
            return Questions
        }
        
        func getResultsData() -> [QuizResults] {
             Result.removeAll()
            let query = "select * from results"
            var stmt : OpaquePointer?
            
            if sqlite3_prepare(questPointer, query, -1, &stmt, nil) != SQLITE_OK {
                let err = String(cString: sqlite3_errmsg(questPointer)!)
                print("error in resuts table creation ", err)
                return Result
            }
            
            while(sqlite3_step(stmt) == SQLITE_ROW) {
                //let id = sqlite3_column_int(stmt, 0)
                let name = String(cString: sqlite3_column_text(stmt, 1))
                let score = sqlite3_column_int(stmt, 3)
                let date = String(cString: sqlite3_column_text(stmt, 2))
                
                
                Result.append(QuizResults(name: name, score: Int(score), date: date))
            }
            
            return Result
        }
        
        func getOneRecord(id: Int) -> QuizDB {
            let query = "select * from quizzes where id = \(id);"
            var stmt : OpaquePointer?
            var quiz : QuizDB?
            
            if sqlite3_prepare(questPointer, query, -1, &stmt, nil) == SQLITE_OK {
                while(sqlite3_step(stmt) == SQLITE_ROW) {
                    let id = sqlite3_column_int(stmt, 0)
                    let name = String(cString: sqlite3_column_text(stmt, 1))
                    
                    quiz = QuizDB(id: Int(id), name: name)
                    
                }
                
            } else {
                print("error in query")
                
            }
            
            return quiz!
        }
        
//        func updateRecord(id: Int) {
//            let query = "update quizzes SET image = '\(image)' where id = ?;"
//            var stmt : OpaquePointer?
//            if sqlite3_prepare(dbpointer, query, -1, &stmt, nil) == SQLITE_OK {
//                sqlite3_bind_int(stmt, 1, Int32(id))
//                if sqlite3_step(stmt) == SQLITE_DONE {
//                    print("data updated")
//                } else {
//                    print("error in updation")
//                }
//            } else {
//                print("error in query")
//            }
//            sqlite3_finalize(stmt)
//        }
        
        func deleteById(id: Int) {
            let query = "delete from quizzes where id = ?;"
            var stmt : OpaquePointer?
            
            if sqlite3_prepare(questPointer, query, -1, &stmt, nil) == SQLITE_OK {
                sqlite3_bind_int(stmt, 1, Int32(id))
                if sqlite3_step(stmt) == SQLITE_DONE {
                    print("record deleted successfully")
                }
                else {
                    print("can not delete record")
                }
                
            } else {
                print("problem in query")
            }
        }
}
