//
//  QuizResults.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/17/22.
//

import Foundation

class Result {
    var name : String
    var score : Int
    var date : String
    
    
    init(name: String, score: Int, date: String){
        self.name = name
        self.score = score
        self.date = date
    }
}
