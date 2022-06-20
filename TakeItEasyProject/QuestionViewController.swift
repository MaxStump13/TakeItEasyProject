//
//  QuestionViewController.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/19/22.
//

import UIKit

class QuestionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var questionCollection : UICollectionView!
    @IBOutlet weak var titleLabel : UILabel!
    
    var quiz : Quiz?
    let score = Score()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (quiz?.calcs.questions.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = questionCollection.dequeueReusableCell(withReuseIdentifier: "questionCell", for: indexPath) as! QuestionCollectionViewCell
        cell.question = quiz?.calcs.questions[indexPath.row]
        cell.answerLabel.text = (quiz?.calcs.questions[indexPath.row])!.selection?.ch
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = quiz?.name

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: Any){
        let result = score.resultToString(quizRes: quiz!)
        
        insertResultsData(name: quiz!.name, score: score.scorePercentage(), date: getDate())
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
