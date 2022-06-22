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
                Question(question: "Which NBA team won 6 championships in the 1990s?", choices: [
                    Choice(ch: "Sixers"),
                    Choice(ch: "Lakers"),
                    Choice(ch: "Celtics"),
                    Choice(ch: "Bulls"),
                    ],
                         correctAns: Choice(ch: "Bulls"), image: UIImage(named: "basketball")!),
                Question(question: "Who has averaged a triple double for a season", choices: [
                    Choice(ch: "Ben Simmons"),
                    Choice(ch: "Kevin Love"),
                    Choice(ch: "Russell Westbrook"),
                    Choice(ch: "Blake Griffin"),
                    ],
                         correctAns: Choice(ch: "Russell Westbrook"), image: UIImage(named: "basketball")!),
                Question(question: "How many championships do the lakers hold?", choices: [
                    Choice(ch: "17"),
                    Choice(ch: "10"),
                    Choice(ch: "2"),
                    Choice(ch: "5"),
                    ],
                    correctAns: Choice(ch: "17"), image: UIImage(named: "basketball")!),
                Question(question: "Who won the first NBA finals MVP?", choices: [
                    Choice(ch: "Lebron James"),
                    Choice(ch: "Michael Jordan"),
                    Choice(ch: "Kobe Bryant"),
                    Choice(ch: "Jerry West"),
                    ],
                    correctAns: Choice(ch: "Jerry West"), image: UIImage(named: "basketball")!),
                Question(question: "Who was the shortest NBA player?", choices: [
                    Choice(ch: "Muggsy bouges"),
                    Choice(ch: "Spud Webb"),
                    Choice(ch: "Allen Iverson"),
                    Choice(ch: "Joel Embied"),
                    ],
                    correctAns: Choice(ch: "2"), image: UIImage(named: "basketball")!),
                
                ])),
            Quiz(name: "Video Games", image : UIImage(named: "games")!, calcs: Calcs(questions: [
                Question(question: "Which is a character in pokemon?", choices: [
                    Choice(ch: "Zelda"),
                    Choice(ch: "Link"),
                    Choice(ch: "Crash"),
                    Choice(ch: "Pikachu"),
                    ],
                         correctAns: Choice(ch: "Pikachu"), image: UIImage(named: "games")!),
                Question(question: "Which pokemon is a fire type?", choices: [
                    Choice(ch: "Mudkip"),
                    Choice(ch: "Squirtle"),
                    Choice(ch: "Ponyta"),
                    Choice(ch: "Kyogre"),
                    ],
                    correctAns: Choice(ch: "Ponyta"), image: UIImage(named: "games")!),
                Question(question: "Who is the ice archer from League of Legends?", choices: [
                    Choice(ch: "Ashe"),
                    Choice(ch: "Jinx"),
                    Choice(ch: "Shaco"),
                    Choice(ch: "Jax"),
                    ],
                    correctAns: Choice(ch: "Ashe"), image: UIImage(named: "games")!),
                Question(question: "Which game involves soccer with cars?", choices: [
                    Choice(ch: "Call of Duty"),
                    Choice(ch: "Fifa"),
                    Choice(ch: "Madden"),
                    Choice(ch: "Rocket League"),
                    ],
                    correctAns: Choice(ch: "Rocket League"), image: UIImage(named: "games")!),
                Question(question: "Which Elder Scrolls game was released in 2011?", choices: [
                    Choice(ch: "Fallout"),
                    Choice(ch: "Morrowind"),
                    Choice(ch: "Oblivion"),
                    Choice(ch: "Skyrim"),
                    ],
                    correctAns: Choice(ch: "2"), image: UIImage(named: "games")!),
                ])),
            Quiz(name: "King Kong", image : UIImage(named: "kong")!, calcs : Calcs(questions: [
            Question(question: "Whe?re is Kong From", choices: [
                Choice(ch: "McDonalds"),
                Choice(ch: "Skull Island"),
                Choice(ch: "Skull Valley"),
                Choice(ch: "Death Valley"),
                ],
                     correctAns: Choice(ch: "Skull Island"), image: UIImage(named: "kong")!),
            Question(question: "Who does Kong love?", choices: [
                Choice(ch: "Scott"),
                Choice(ch: "Emily"),
                Choice(ch: "Mary"),
                Choice(ch: "Jane"),
                ],
                     correctAns: Choice(ch: "Jane"), image: UIImage(named: "kong")!),
            Question(question: "Where does Kong go?", choices: [
                Choice(ch: "LA"),
                Choice(ch: "Houston"),
                Choice(ch: "NY"),
                Choice(ch: "D.C."),
                ],
                correctAns: Choice(ch: "NY"), image: UIImage(named: "kong")!),
            Question(question: "Who stars in the movie?", choices: [
                Choice(ch: "Jack Black"),
                Choice(ch: "Robert DiNero"),
                Choice(ch: "Leonardo DiCaprio"),
                Choice(ch: "Al Paccino"),
                ],
                     correctAns: Choice(ch: "Jack Black"), image: UIImage(named: "kong")!),
            Question(question: "What do they run into when looking for Kong", choices: [
                Choice(ch: "Monsters"),
                Choice(ch: "Demons"),
                Choice(ch: "Wizards"),
                Choice(ch: "Dinosaurs"),
                ],
                correctAns: Choice(ch: "Dinosaurs"), image: UIImage(named: "kong")!),
            ])),
            Quiz(name: "Internet", image : UIImage(named: "internet")!, calcs : Calcs(questions: [
            Question(question: "What is a search engine", choices: [
                Choice(ch: "Zoom"),
                Choice(ch: "Discord"),
                Choice(ch: "Google"),
                Choice(ch: "Xcode"),
                ],
                     correctAns: Choice(ch: "Google"), image: UIImage(named: "internet")!),
            Question(question: "What is it called when you save a webpage?", choices: [
                Choice(ch: "Bookmark"),
                Choice(ch: "History"),
                Choice(ch: "Cache"),
                Choice(ch: "Cookie"),
                ],
                correctAns: Choice(ch: "Bookmark"), image: UIImage(named: "internet")!),
            Question(question: "Which is a browser?", choices: [
                Choice(ch: "Steam"),
                Choice(ch: "Origin"),
                Choice(ch: "VSCode"),
                Choice(ch: "Chrome"),
                ],
                correctAns: Choice(ch: "Chrome"), image: UIImage(named: "internet")!),
            Question(question: "What is googles browser", choices: [
                Choice(ch: "Safari"),
                Choice(ch: "Chrome"),
                Choice(ch: "Firefox"),
                Choice(ch: "Edge"),
                ],
                correctAns: Choice(ch: "Chrome"), image: UIImage(named: "internet")!),
            Question(question: "Which site can you watch videos for free?", choices: [
                Choice(ch: "Netflix"),
                Choice(ch: "Hulu"),
                Choice(ch: "Youtube"),
                Choice(ch: "HBO"),
                ],
                correctAns: Choice(ch: "Youtube"), image: UIImage(named: "internet")!),
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

