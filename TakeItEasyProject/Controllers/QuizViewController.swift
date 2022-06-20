//
//  QuizViewController.swift
//  TakeItEasyProject
//
//  Created by Maximilian Stump on 6/17/22.
//

import UIKit

class QuizViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    var quizzes = Quiz.getQuizzes()
    var quizDB : [QuizDB]?
    
    @IBOutlet weak var collView: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(quizzes.count)
//        print(quizDB)
        return quizzes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! QuizCollectionViewCell
        cell.quiz = quizDB![indexPath.row]
        cell.resLab.text = String(QuizLabelRes.qLabel.qresL[indexPath.row])
        print(cell.quiz.name)
        print(cell.quiz.image)
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected cell")
        let questionViewCont = storyboard?.instantiateViewController(withIdentifier: "QuestionsVC") as! QuestionViewController
        questionViewCont.quiz = quizzes[indexPath.row]
        QuizLabelRes.qLabel.id = indexPath.row
        present(questionViewCont, animated: true, completion: nil)
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    @IBOutlet weak var username: UILabel!
    @IBAction func refresh(_ sender: Any) {
        collView.reloadData()
    }
    @IBAction func logout(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var front = Design().gradient(boundary: view)
        view.layer.insertSublayer(front, at: 0)
        
        collView.dataSource = self
        collView.delegate = self
        
        initializeSQLite()
        insertAllData()
        quizDB = SQLite.sqlObj.getData()
        // Do any additional setup after loading the view.
    }
    

}
