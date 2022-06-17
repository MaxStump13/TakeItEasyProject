//
//  Score.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/17/22.
//

import Foundation

class Score{
    var score : Double = 0
    var possibleScore : Double = 5

    func getScore(submittedQuiz: Quiz) -> (Int, Int) {
            print("Quiz submitted")
            getScoreHelper(submittedQuiz: submittedQuiz)
            return (score: Int(score), total: Int(possibleScore))
        }
        
        private func getScoreHelper(submittedQuiz: Quiz) {
            for x in submittedQuiz.options.qs {
                if (x.correctAns.selection == x.selection.selection) {
                    score = score + 1
                }
            }
        }
        
        func percentageScore() -> Int {
            let result : Double = (score / possibleScore) * 100
            return Int(result)
        }
        
        func formatToString(submittedQuiz: Quiz) -> String {
            getScoreHelper(submittedQuiz: submittedQuiz)
            let toString = "You scored \(Int(score)) out of \(Int(possibleScore))"
            print(toString)
            return toString
        }}
