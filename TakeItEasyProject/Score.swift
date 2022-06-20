//
//  Score.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/17/22.
//

import Foundation

class Score{
    let max : Double = 5
    var score : Double = 0

        func getScore(quizRes : Quiz) -> (Int, Int){
            getScoreCalc(quizRes: quizRes)
            return (score : Int(score), maxScore : Int(max))
        }
        
        private func getScoreCalc(quizRes : Quiz){
            for x in quizRes.calcs.questions {
                if (x.correctAns.ch == x.selection!.ch){
                    score = score + 1
                }
            }
        }
        
        func scorePercentage() -> Int {
            let result : Double = (score / max) * 100
            return Int(result)
        }
        func resultToString(quizRes : Quiz) -> String {
            getScoreCalc(quizRes: quizRes)
            let str = "Final Score \(Int(score)) out of a total \(Int(max))"
            return str
        }
        
    }
