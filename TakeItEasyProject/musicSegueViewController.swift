//
//  musicSegueViewController.swift
//  TakeItEasyProject
//
//  Created by Corey Augburn on 6/19/22.
//

import UIKit
import AVFoundation

extension UIImageView{
    func segueLoader(urlString: String){
        let urlRequest = URL(string: urlString)
                if urlRequest == nil{
                    print("url does not exist")
                    return
                }
                print("url does exista")
                let dataTask = URLSession.shared.dataTask(with: urlRequest!, completionHandler: { data, response, error in
                    if error == nil && data != nil{
                        let image = UIImage(data: data!)
                        DispatchQueue.main.async { [self] in
                            self.image = image
                            
                            
                        }
                    }
                    else{
                        print("error loading web image")
                    }
                })
                dataTask.resume()
            }
}

class musicSegueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var front = Design().gradient(boundary: self.view)
        view.layer.insertSublayer(front, at: 0)
        
//        artImg.image = art
        artistName.text = name
        songTitle.text = songName
        
        artImg.segueLoader(urlString: urlPicture)
        
        loadRadio(radioURL: music)
        
    }
    

    @IBOutlet weak var artImg: UIImageView!
   
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var songTitle: UILabel!
    
    @IBOutlet weak var progBar: UIProgressView!
    
    @IBOutlet weak var startTime: UILabel!
    
    @IBOutlet weak var resultTime: UILabel!
    
    
    var player : AVPlayer?
    
    var name = ""
    var songName = ""
    var art = UIImage()
    var urlPicture = ""
    var music = ""
    
    
    var myTime : Int = 30
    var timer = Timer()
    var secondsRemaining = 0
    var isPlaying : Bool = false
    
    
    
    
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
    
    
    @IBAction func playBtn(_ sender: Any) {
        self.isPlaying.toggle()
        if isPlaying == true {
            player?.pause()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }else{
            player?.play()
        }
    }
    
    
    
    @IBAction func nextBtn(_ sender: Any) {
        
    }
    
    
    func next(){
        
        
    }
    
    
    @objc func updateTimer(){
        if secondsRemaining < myTime{
            
            secondsRemaining += 1
            progBar.progress = Float(secondsRemaining) / Float(myTime)
            
        }else{
            timer.invalidate()
        }
    
    }
    func secToMin(seconds: Int) ->(Int, Int){
        return (((seconds % 3600) / 60),((seconds % 3600) % 60))
    }
    
    
    
   
    
    func loadRadio(radioURL: String) {
        
        timer.invalidate()
            guard let url = URL.init(string: radioURL) else { return }
            let playerItem = AVPlayerItem.init(url: url)
            player = AVPlayer.init(playerItem: playerItem)
            player!.play()
//            startNowPlayingAnimation(true)
//            played = true
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
//        progBar.progress
        }
    
    
}
