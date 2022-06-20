//
//  Quiz.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/17/22.
//

import Foundation
import UIKit

class Quiz {
    var name : String
    var image : UIImage
    var calcs : Calcs
    
    init(name : String, image : UIImage, calcs : Calcs){
        self.name = name
        self.image = image
        self.calcs = calcs
    }
    
    static func getQuizzes() -> [Quiz]{
//        need to add 3 more Quizzes with 5 Qs
        
        return [
            Quiz(name: "Math", image : UIImage(named: "1")!, calcs: Calcs(questions: [
                Question(question: "5+2", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                         correctAns: Choice(ch: "7"), image: UIImage(named: "1")!),
                Question(question: "5+1", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                         correctAns: Choice(ch: "7"), image: UIImage(named: "1")!),
                Question(question: "5+5", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "7"), image: UIImage(named: "1")!),
                ])),
            Quiz(name: "Test", image : UIImage(named: "1")!, calcs: Calcs(questions: [
                Question(question: "5+6", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                         correctAns: Choice(ch: "7"), image: UIImage(named: "1")!),
                Question(question: "5+8", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "7"), image: UIImage(named: "1")!),
                Question(question: "5+0", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "7"), image: UIImage(named: "1")!),
                ])),
            Quiz(name: "Test2", image : UIImage(named: "1")!, calcs : Calcs(questions: [
            Question(question: "5+18", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "2"),
                Choice(ch: "5"),
                ],
                     correctAns: Choice(ch: "7"), image: UIImage(named: "1")!),
            Question(question: "5+90", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "2"),
                Choice(ch: "5"),
                ],
                correctAns: Choice(ch: "7"), image: UIImage(named: "1")!),
            Question(question: "5+33", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "2"),
                Choice(ch: "5"),
                ],
                correctAns: Choice(ch: "7"), image: UIImage(named: "1")!),
            ]))
        ]
        
    }
    
}

class Question {
    var question : String
    var choices : [Choice]
    var correctAns : Choice
    var selection : Choice?
    var image : UIImage
    
    init(question: String, choices: [Choice], correctAns : Choice, image: UIImage){
        self.question = question
        self.choices = choices
        self.correctAns = correctAns
        self.image = image
//        self.selection = selection
    }
    
    func userChoice(ans : Choice){
        selection!.ch = ans.ch
    }
    
}

class Choice{
    var ch : String
    init(ch : String){
        self.ch = ch
    }
}

class Calcs {
    var questions : [Question]
    init(questions : [Question]){
        self.questions = questions
    }
}

