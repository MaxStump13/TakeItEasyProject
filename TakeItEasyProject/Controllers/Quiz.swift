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
            Quiz(name: "NBA", image : UIImage(named: "basketball")!, calcs: Calcs(questions: [
                Question(question: "5+2", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                         correctAns: Choice(ch: "7"), image: UIImage(named: "basketball")!),
                Question(question: "5+1", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "6"),
                    Choice(ch: "5"),
                    ],
                         correctAns: Choice(ch: "6"), image: UIImage(named: "basketball")!),
                Question(question: "5+5", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "10"), image: UIImage(named: "basketball")!),
                Question(question: "5+10", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "15"),
                    ],
                    correctAns: Choice(ch: "15"), image: UIImage(named: "basketball")!),
                Question(question: "1+1", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "2"), image: UIImage(named: "basketball")!),
                
                ])),
            Quiz(name: "Video Games", image : UIImage(named: "games")!, calcs: Calcs(questions: [
                Question(question: "6-5", choices: [
                    Choice(ch: "1"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                         correctAns: Choice(ch: "1"), image: UIImage(named: "games")!),
                Question(question: "8-5", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "3"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "3"), image: UIImage(named: "games")!),
                Question(question: "5-0", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "5"), image: UIImage(named: "games")!),
                Question(question: "15-5", choices: [
                    Choice(ch: "7"),
                    Choice(ch: "10"),
                    Choice(ch: "3"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "10"), image: UIImage(named: "games")!),
                Question(question: "7-5", choices: [
                    Choice(ch: "2"),
                    Choice(ch: "10"),
                    Choice(ch: "3"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "2"), image: UIImage(named: "games")!),
                ])),
            Quiz(name: "King Kong", image : UIImage(named: "kong")!, calcs : Calcs(questions: [
            Question(question: "2*2", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "4"),
                Choice(ch: "5"),
                ],
                     correctAns: Choice(ch: "4"), image: UIImage(named: "kong")!),
            Question(question: "7*2", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "14"),
                Choice(ch: "5"),
                ],
                     correctAns: Choice(ch: "14"), image: UIImage(named: "kong")!),
            Question(question: "5*2", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "2"),
                Choice(ch: "5"),
                ],
                correctAns: Choice(ch: "10"), image: UIImage(named: "kong")!),
            Question(question: "2*6", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "12"),
                Choice(ch: "5"),
                ],
                     correctAns: Choice(ch: "12"), image: UIImage(named: "kong")!),
            Question(question: "5*5", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "25"),
                Choice(ch: "5"),
                ],
                correctAns: Choice(ch: "25"), image: UIImage(named: "kong")!),
            ])),
            Quiz(name: "Internet", image : UIImage(named: "internet")!, calcs : Calcs(questions: [
            Question(question: "10/2", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "2"),
                Choice(ch: "5"),
                ],
                     correctAns: Choice(ch: "5"), image: UIImage(named: "internet")!),
            Question(question: "20/4", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "2"),
                Choice(ch: "5"),
                ],
                correctAns: Choice(ch: "5"), image: UIImage(named: "internet")!),
            Question(question: "21/3", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "2"),
                Choice(ch: "5"),
                ],
                correctAns: Choice(ch: "7"), image: UIImage(named: "internet")!),
            Question(question: "6/3", choices: [
                Choice(ch: "7"),
                Choice(ch: "10"),
                Choice(ch: "2"),
                Choice(ch: "5"),
                ],
                correctAns: Choice(ch: "2"), image: UIImage(named: "internet")!),
            Question(question: "7/7", choices: [
                Choice(ch: "7"),
                Choice(ch: "1"),
                Choice(ch: "2"),
                Choice(ch: "5"),
                ],
                correctAns: Choice(ch: "1"), image: UIImage(named: "internet")!),
            ]))
        ]
        
    }
    
}

class Question {
    var question : String
    var choices : [Choice]
    var correctAns : Choice
    var selection = Choice(ch: "")
    var image : UIImage
    
    init(question: String, choices: [Choice], correctAns : Choice, image: UIImage){
        self.question = question
        self.choices = choices
        self.correctAns = correctAns
        self.image = image
//        self.selection = selection
    }
    
    func userChoice(ans : Choice){
        selection.ch = ans.ch
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

