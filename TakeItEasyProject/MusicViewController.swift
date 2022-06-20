//
//  MusicViewController.swift
//  TakeItEasyProject
//
//  Created by Corey Augburn on 6/16/22.
//

import UIKit
import AVFoundation
import MusicKit


class MusicViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    

    var player : AVPlayer?

    let itunesURL = "https://itunes.apple.com/search?entity=song"
    
    var trackName : [String] = []
    var artist : [String] = []
    var song : [String] = []
    var art60 : [String] = []
    var art100 : [String] = []
    
    
    
    @IBOutlet weak var searchField: UITextField!
    
    @IBOutlet weak var tableview: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var front = Design().gradient(boundary: self.view)
        view.layer.insertSublayer(front, at: 0)

            let url = "https://itunes.apple.com/search?entity=song&term=taylor+swift"
                getData(from : url)
        
        tableview.reloadData()
        
    }
    
    
    
    var results = [Result]()

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackName.count
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicCollectionViewCell
        
        
            myCell.musicLabel.text = self.artist[indexPath.row]
            myCell.musicTitle.text = self.trackName[indexPath.row]
            
        self.imageLoader(urlString: self.art100[indexPath.row], cell: myCell)
        
        
       
        
        myCell.reloadInputViews()
        return myCell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicCollectionViewCell
//        switch indexPath.row{
//
//        case 0:
//            getData(from: song[0])
//            loadRadio(radioURL: song[0])
//        case 1:
//            getData(from: song[1])
//            print(song[1])
//            loadRadio(radioURL: song[1])
//        case 2:
//            getData(from: song[2])
//            print(song[2])
//            loadRadio(radioURL: song[2])
//        case 3:
//            getData(from: song[3])
//            print(song[3])
//            loadRadio(radioURL: song[3])
//        case 4:
//            getData(from: song[4])
//            print(song[4])
//            loadRadio(radioURL: song[4])
//        default:
//            print("")
//
//        }
        imageLoader(urlString: art100[indexPath.row], cell: myCell)
        
        var storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var musicSegueVC = storyBoard.instantiateViewController(withIdentifier: "musicSegue") as! musicSegueViewController
        var myImg = imageLoader(urlString: art100[indexPath.row], cell: myCell)
        
//        musicSegueVC.art = myImg
        
        musicSegueVC.music = song[indexPath.row]
        musicSegueVC.urlPicture = art100[indexPath.row]
        musicSegueVC.name = artist[indexPath.row]
        musicSegueVC.songName = trackName[indexPath.row]
        present(musicSegueVC, animated: true)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    

    
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//            var storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            var musicSegueVC = storyBoard.instantiateViewController(withIdentifier: "musicSegue") as! musicSegueViewController
//            musicSegueVC.artImg
//            musicSegueVC.artistName
//            musicSegueVC.songTitle
//            present(musicSegueVC, animated: true)
//        }
    
    

    
    func getData(from url : String) {
       
     URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, resp,err in

            guard let data = data, err == nil else{
                print("something went wrong")
                return
            }
            print(resp)
            var result : Response?
            do{
                print("in data ", data)
                result = try JSONDecoder().decode(Response.self, from: data)
                
                for i in 0..<5{
                var track = result!.results[i].trackName
                var collection = result!.results[i].collectionName
                var song = result!.results[i].previewUrl
                var artwork60 = result!.results[i].artworkUrl60
                var artwork100 = result!.results[i].artworkUrl100
                
                
//                print(track)
//                print(collection)
//                print(song)
//                print(artwork60)
                self.trackName.append(track)
                self.artist.append(collection)
                self.song.append(song)
                self.art60.append(artwork60)
                self.art100.append(artwork100)
                    
                    
                    
                }
                
            }
            catch let err{
                print(err)
                
            }
            guard let json = result else{
                print("error in result")
                return
            }
//         print("data are ", json.results)
         
        }).resume()
        
        print("this is ")
        
    }


    //
    struct Response: Codable {
        var results: [Result]
    }

    



struct Result: Codable{
    var trackName: String
    var collectionName: String
    var previewUrl: String
    var artworkUrl60 : String
    var artworkUrl100: String
}
    
    

func imageLoader(urlString: String, cell : MusicCollectionViewCell){
    let urlRequest = URL(string: urlString)
            if urlRequest == nil{
                print("url does not exist")
                return
            }
            print("url does exists")
            let dataTask = URLSession.shared.dataTask(with: urlRequest!, completionHandler: { data, response, error in
                if error == nil && data != nil{
                    DispatchQueue.main.async { [self] in
                    
                        cell.musicImg.image = UIImage(data: data!)
                        cell.reloadInputViews()
                    }
                }
                else{
                    print("error loading web image")
                }
            })
            dataTask.resume()
        }
    
    

    
    func loadRadio(radioURL: String) {

            guard let url = URL.init(string: radioURL) else { return }
            let playerItem = AVPlayerItem.init(url: url)
            player = AVPlayer.init(playerItem: playerItem)
            player!.play()
//            startNowPlayingAnimation(true)
//            played = true
        }
    
    
   
    
    
    
    @IBAction func searchButton(_ sender: Any) {
        player?.pause()
        self.trackName.removeAll()
        self.artist.removeAll()
        self.song.removeAll()
        self.art60.removeAll()
        self.art100.removeAll()
        var artist = searchField.text!
        var artistText = artist.replacingOccurrences(of: " ", with: "+")
        var url = "\(itunesURL)&term=\(artistText)"
        getData(from : url)
        print("the url ", url)
        print("the artist ", artist)
        
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        if segue.identifier ==
//    }
//
    
    
    
    
    
    
    
//    func insertItems(){
//        collectionView.performBatchUpdates({
//            for _ in 0..<5{
//                let indexPath = indexPath(row: data.count - 1, section: 0)
//                collectionView.insertItems(at: [indexPath])
//            }
//        }, completion: nil)
//    }
    
    

}
