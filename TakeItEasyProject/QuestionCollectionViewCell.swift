//
//  QuestionCollectionViewCell.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/19/22.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var button1 : UIButton!
    @IBOutlet weak var button2 : UIButton!
    @IBOutlet weak var button3 : UIButton!
    @IBOutlet weak var button4 : UIButton!
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var questionLabel : UILabel!
    @IBOutlet weak var answerLabel : UILabel!
    
    var question : Question! {
    didSet {
        self.updateQuestion()
    }
    }
    func updateQuestion(){
        if let question = question {
            questionLabel.text = question.question
            button1.setTitle(question.choices[0].ch, for: .normal)
            button2.setTitle(question.choices[1].ch, for: .normal)
            button3.setTitle(question.choices[2].ch, for: .normal)
            button4.setTitle(question.choices[3].ch, for: .normal)
            
            imageView.image = question.image
            
        }
    }
    
    @IBAction func choose1(_ sender: Any){
        question.userChoice(ans: question.choices[0])
        answerLabel.text = question.selection?.ch
    }
    @IBAction func choose2(_ sender: Any){
        question.userChoice(ans: question.choices[1])
        answerLabel.text = question.selection?.ch
    }
    @IBAction func choose3(_ sender: Any){
        question.userChoice(ans: question.choices[2])
        answerLabel.text = question.selection?.ch
    }
    @IBAction func choose4(_ sender: Any){
        question.userChoice(ans: question.choices[3])
        answerLabel.text = question.selection?.ch
    }
    
}

