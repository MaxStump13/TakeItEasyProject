//
//  Question.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/17/22.
//

import Foundation

class Question{
    var question : String
    var answers : [Answer]
    var correctAns : Answer
    var selection = Answer(selection: "")
    
    init(question : String, answers: [Answer], correctAns : Answer){
        self.question = question
        self.answers = answers
        self.correctAns = correctAns
    }
    func selectedAns(ans: Answer){
        self.selection = ans
    }
    func showAns(){
        print(selection.selection as String)
        
    }
}
