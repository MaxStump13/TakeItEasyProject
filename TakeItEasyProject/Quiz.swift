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
    var options : Options
    
    init(name : String, options : Options){
        self.name = name
        self.options = options
    }
    
    static func getQuizzes() -> [Quiz]{
        return [
            Quiz(name: "Math", options: Options(qs: [
                Question(question: "5+2", answers: [
                    Answer(selection: "7"),
                    Answer(selection: "10"),
                    Answer(selection: "2"),
                    Answer(selection: "5"),
                    ],
                    correctAns: Answer(selection: "7")),
                Question(question: "4 x 4", answers: [
                    Answer(selection: "3"),
                    Answer(selection: "1"),
                    Answer(selection: "16"),
                    Answer(selection: "25"),
                ],
                    correctAns: Answer(selection: "16")),
                Question(question: "4 x 3", answers: [
                    Answer(selection: "3"),
                    Answer(selection: "12"),
                    Answer(selection: "16"),
                    Answer(selection: "25"),
                ],
                    correctAns: Answer(selection: "12")),
                Question(question: "4 x 1", answers: [
                    Answer(selection: "4"),
                    Answer(selection: "1"),
                    Answer(selection: "16"),
                    Answer(selection: "25"),
                ],
                    correctAns: Answer(selection: "4")),
                Question(question: "0 x 4", answers: [
                    Answer(selection: "3"),
                    Answer(selection: "1"),
                    Answer(selection: "0"),
                    Answer(selection: "25"),
                ],
                    correctAns: Answer(selection: "0")),
        ])),
        ]
    }
}
//class Question{
//    var question : String
//    var answers : [Answer]
//    var correctAns : Answer
//    var selection = Answer(selection: "")
//
//    init(question : String, answers: [Answer], correctAns : Answer){
//        self.question = question
//        self.answers = answers
//        self.correctAns = correctAns
//    }
//    func selectedAns(ans: Answer){
//        self.selection = ans
//    }
//    func showAns(){
//        print(selection.selection as String)
//
//    }
//}
//class Answer {
//    var selection : String
//    init(selection : String){
//        self.selection = selection
//    }
//}
//
//class Options {
//    var qs : [Question]
//
//    init(qs : [Question]){
//        self.qs = qs
//    }
//
//}
