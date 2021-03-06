//
//  QuizCollectionViewCell.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/19/22.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resLab: UILabel!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var points: UILabel!
    
    
    var quiz : QuizDB! {
        didSet {
            print("updatecoll is running")
            self.updateCollView()
        }
    }
    func updateCollView(){
        if let quiz = quiz{
            imageView.image = UIImage(named: quiz.image)
            label.text = quiz.name
        }else{
            imageView.image = nil
            label.text = nil
        }
        
    }
}
