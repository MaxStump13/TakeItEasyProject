//
//  SQLHelper.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/19/22.
//

import Foundation
import UIKit

func getData() -> [QuizDB]{
    return SQLite.sqlObj.getData()
}
func getReusltData() -> [Result]{
    return SQLite.sqlObj.getResultsData()
}
func getQuiz(id: Int) -> QuizDB{
    return SQLite.sqlObj.getOneRecord(id: id)
}

func insertAllData(){
//    var quizData = SQLiteDB.sqlObj.getData()
//    print(quizData)
    for(index, x) in quizData.enumerated(){
        
        SQLite.sqlObj.insertData(name: x.name as NSString, image: x.image as NSString)
        print(x.name)
    }
}
func insertResultsData(name: String, score: Int, date: String){
    SQLite.sqlObj.insertResultsData(name: name as NSString, score: score as NSNumber, date: date as NSString)
}
func deleteById(id : Int){
    SQLite.sqlObj.deleteById(id: id)
}
func deleteAllData(){
    let database = getData()
    for (index, x) in database.enumerated(){
        SQLite.sqlObj.deleteById(id: (index + 1))
    }
}

func initializeSQLite(){
    SQLite.sqlObj.createDB()
    SQLite.sqlObj.createTable()
    SQLite.sqlObj.createResultsTable()
//    deleteAllData()
    insertAllData()
    print("AAAAAAH!")
    
    
    
}

func getDate() -> String{
    let date = Date()
    let dateForm = DateFormatter()
    let cal = Calendar.current
    let calComponents = cal.dateComponents([.month, .day], from: date)
    let day = calComponents.day
    let month = calComponents.month
    dateForm.dateFormat = "yyyy"
    let year = dateForm.string(from: date)
    return "\(year)-\(month!)-\(day!)"
}

