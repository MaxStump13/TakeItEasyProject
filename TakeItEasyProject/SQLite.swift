//
//  SQLite.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/17/22.
//

import Foundation
import SQLite3
class SQLite {
    static var sqlObj = SQLite()
    
    var Quizzes = [QuizDB]()
    var Results = [Result]()
    
    var dbPointer : OpaquePointer?
    
    func createDB(){
//        print("about to create DB")
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("pop.sqlite")
//        print("creating db")
        if sqlite3_open(filePath.path, &dbPointer) != SQLITE_OK{
            print("can not open DB")
        }
        
    }
    let stmt1 = "create table if not exists quizzes (id integer primary key autoincrement, name text, image text)"
    func createTable(){
//        print("about to create table")
        if sqlite3_exec(dbPointer, stmt1, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
//            print("creating table")
            print("error in table creation ", err)
        }
    }
    let stmt2 = "create table if not exists results (id integer primary key autoincrement, name text, score integer, date text)"
    func createResultsTable(){
        if sqlite3_exec(dbPointer, stmt2, nil, nil, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in results table creation ", err)
        }
    }
    
    
    func insertData(name : NSString, image: NSString){
        var stmt : OpaquePointer?
        let query = "insert into quizzes (name, image) values (?,?)"
        
        if sqlite3_prepare(dbPointer, query, -1, &stmt, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in query creation ", err)
        }
        
        if sqlite3_bind_text(stmt, 1, name.utf8String, -1, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in saving name ", err)
        }
        
        if sqlite3_bind_text(stmt, 2, image.utf8String, -1, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in saving image ", err)
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in table creation ", err)
        }
        
        print("data saved ")
    }
    func insertResultsData(name : NSString, score: NSNumber, date: NSString){
        var stmt : OpaquePointer?
        let query = "insert into results (name, score, date) values (?,?,?)"
        
        if sqlite3_prepare(dbPointer, query, -1, &stmt, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in query creation ", err)
        }
        
        if sqlite3_bind_text(stmt, 1, name.utf8String, -1, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in saving name ", err)
        }
        if sqlite3_bind_int(stmt, 2, Int32(truncating: score)) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in saving score ", err)
        }
        if sqlite3_bind_text(stmt, 3, date.utf8String, -1, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in saving date ", err)
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in table creation ", err)
        }
        
        print(" result data saved ")
    }
    
    func insertAllData(quizData : [QuizDB]){
        var stmt : OpaquePointer?
        let query = "insert into quizzes (name, image) values (?,?)"
        
        if sqlite3_prepare(dbPointer, query, -1, &stmt, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in query creation ", err)
        }
        for(index, quiz) in quizData.enumerated(){
        
            let quizName : NSString = quiz.name as NSString
        if sqlite3_bind_text(stmt, 1, quizName.utf8String, -1, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in saving name ", err)
        }
            let quizImage : NSString = quiz.image as NSString
        if sqlite3_bind_text(stmt, 2, quizImage.utf8String, -1, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in saving image ", err)
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in table creation ", err)
        }
        
        print("data saved ")
        }
    }
    func getData() -> [QuizDB]{
        Quizzes.removeAll()
        let query = "select * from quizzes"
        var stmt : OpaquePointer?
        
        if sqlite3_prepare(dbPointer, query, -1, &stmt, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in table creation ", err)
            return Quizzes
        }
//        print(sqlite3_step(stmt))
//        print(SQLITE_OK)
        while(sqlite3_step(stmt) == SQLITE_ROW){
//            print("Inside while statement")
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let image = String(cString: sqlite3_column_text(stmt, 2))
            
            Quizzes.append(QuizDB(id: Int(id), name: name, image: image))
        }
//        print(sqlite3_step(stmt),"        ", (SQLITE_ROW))
        
        return Quizzes
    }
    func getResultsData() -> [Result]{
        Results.removeAll()
        let query = "select * from results"
        var stmt : OpaquePointer?
        
        if sqlite3_prepare(dbPointer, query, -1, &stmt, nil) != SQLITE_OK{
            let err = String(cString: sqlite3_errmsg(dbPointer)!)
            print("error in table creation ", err)
            return Results
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
//            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let score = sqlite3_column_int(stmt, 3)
            let date = String(cString: sqlite3_column_text(stmt, 3))
            
            Results.append(Result(name: name, score: Int(score), date: date))
        }
        
        return Results
    }
    
    func getOneRecord(id : Int) -> QuizDB{
        let query = "select * from quizzes where id = \(id);"
        var stmt : OpaquePointer?
        var quiz : QuizDB?
        if sqlite3_prepare(dbPointer, query, -1, &stmt, nil) == SQLITE_OK{
            
            while (sqlite3_step(stmt) == SQLITE_ROW){
                let id = sqlite3_column_int(stmt, 0)
                let name = String(cString: sqlite3_column_text(stmt, 1))
                let image = String(cString: sqlite3_column_text(stmt, 2))
                
                quiz = QuizDB(id: Int(id), name: name, image: image)
            }
        }
        else{
            print("error in query")
            
        }
        return quiz!
    }
    
    func updateRecord(id : Int, image : NSString){
        let query = "update quizzes SET image = '\(image)' where id = ?;"
        var stmt : OpaquePointer?
        if sqlite3_prepare(dbPointer, query, -1, &stmt, nil) == SQLITE_OK{
            sqlite3_bind_int(stmt, 1, Int32(id))
            if sqlite3_step(stmt) == SQLITE_DONE{
                print("data updated")
            }
            else{
                print("error in updation")
                
            }
        }
        else{
            print("error in query")
        }
        sqlite3_finalize(stmt)
    }
    
    func deleteById(id : Int){
        let query = "delete from quizzes where id = ?;"
        var stmt : OpaquePointer?
        if sqlite3_prepare(dbPointer, query, -1, &stmt, nil) ==  SQLITE_OK{
            sqlite3_bind_int(stmt, 1, Int32(id))
            if sqlite3_step(stmt) == SQLITE_DONE{
                print("record deleted successfully")
            }
            else{
                print("can not delete record")
            }
        }else{
            print("problem in query")
        }
       
        
    }
    
}
