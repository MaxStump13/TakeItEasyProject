//
//  MusicViewController.swift
//  TakeItEasyProject
//
//  Created by Corey Augburn on 6/16/22.
//

import UIKit
import AVKit



class MusicViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    var trackName : [String] = []
    var artist : [String] = []
    var song : [String] = []
    var art60 : [String] = []
    var art100 : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let url = "https://itunes.apple.com/search?entity=song&term=taylor+swift"
        getData(from : url)
    }
    
    
    
    var results = [Result]()

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trackName.count
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MusicCollectionViewCell
        
        myCell.musicLabel.text = artist[indexPath.row]
        myCell.titleLable.text = trackName[indexPath.row]
        
//        imageLoader(urlString: self.art60[indexPath.row], cell: myCell)
       
            
        return myCell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        switch indexPath.row{
//        case 0:
//
//        case 1:
//
//        case 2:
//
//        case 3:
//
//        case 4:
//
//        default:
//            print("")
//
//        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    

    
    func getData(from url : String) {
       
     URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, resp,err in

            guard let data = data, err == nil else{
                print("something went wrong")
                return
            }
            print(resp)
            var result : MovieModel?
            do{
                print("in data ", data)
                result = try JSONDecoder().decode(MovieModel.self, from: data)
                
                for i in 0..<5{
                var track = result!.results[i].trackName
                var collection = result!.results[i].collectionName
                var song = result!.results[i].previewUrl
                var artwork60 = result!.results[i].artworkUrl60
                var artwork100 = result!.results[i].artworkUrl100
                
                
//                print(track)
//                print(collection)
                print(song)
                print(artwork60)
                self.trackName.append(track)
                self.artist.append(collection)
                self.song.append(song)
                self.art60.append(artwork60)
                self.art100.append(artwork100)
                }
//                let made = Result(trackName: track, collectionName: collection, previewUrl: song)
                
            }
            catch let err{
                print(err)
                
            }
            guard let json = result else{
                print("error in result")
                return
            }
         print("data are ", json.results)
         
        }).resume()
        
        print("this is ")
        
    }


    struct MovieModel: Codable {
//        let title: String
//        let description: String
        //let movies: [Movies]
        var results: [Result]
    }

    



struct Result: Codable{
//        let trackId: Int
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
                    DispatchQueue.main.async {
                        cell.musicImg.image = UIImage(data: data!)
                    }
                }
                else{
                    print("error loading web image")
                }
            })
            dataTask.resume()
        }

}
