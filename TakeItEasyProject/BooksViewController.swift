//
//  BooksViewController.swift
//  TakeItEasyProject
//
//  Created by Liban Abdinur on 6/16/22.
//

import UIKit

class BooksViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate{
    
    
    
    
    
  
    
    
  

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return filteredBooks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCell", for: indexPath) as! GeneralBookCollectionViewCell
        bookCell.layer.cornerRadius = 5.0
        bookCell.layer.masksToBounds = true

            bookCell.backgroundColor = .yellow
            bookCell.nameA.text = filteredBooks[indexPath.row].volumeInfo.title
            if let imageUrl = URL(string: filteredBooks[indexPath.row].volumeInfo.imageLinks.thumbnail),
               let data = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        bookCell.ImageBackground.image = image
                    }
                }

            }


            return bookCell





    }
    

     
    
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let storyObject = UIStoryboard(name: "BookMain", bundle: nil)
        let bookWebController = storyObject.instantiateViewController(withIdentifier: "web") as! BookWebViewController

        bookWebController.bookName = filteredBooks[indexPath.row].volumeInfo.previewLink

        navigationController?.pushViewController(bookWebController, animated: true)
        

    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerms = searchText != "" ? searchText: nil
        DispatchQueue.main.async {
            self.GeneralBooksCollection.reloadData()
        }
        
    }
    
    
    
    var GeneralBooks:[Books] = []
    var TechBooks:[Books] = []
    var CookBooks:[Books] = []
    var searchTerms: String?
    
    var filteredBooks: [Books]{
        if let searchTerms = searchTerms {
            return GeneralBooks.filter({$0.volumeInfo.title.lowercased().contains(searchTerms.lowercased())})
        }else{
            return GeneralBooks
        }
    }
    
    
    
    @IBOutlet weak var GeneralBooksCollection: UICollectionView!
    
    //@IBOutlet weak var TechBooksCollection: UICollectionView!
    
    
    //@IBOutlet weak var CookBooksCollection: UICollectionView!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         fetchBooks(urlString: "https://www.googleapis.com/books/v1/volumes?&q=cookpdf&key=AIzaSyDFPkdgwDotfduJ8MH-QR128RNdMn-Wo24") {
            
            DispatchQueue.main.async {
               self.GeneralBooksCollection.reloadData()
            }
        }
        
        


        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.GeneralBooksCollection.reloadData()
//        self.TechBooksCollection.reloadData()
//        self.CookBooksCollection.reloadData()
//    }
    

    func fetchBooks(urlString: String ,booksCompletionHandler: @escaping(/*BooksAPI*/) -> ()){
      //  let urlString = "https://www.googleapis.com/books/v1/volumes?q=cookpdf&key=AIzaSyDFPkdgwDotfduJ8MH-QR128RNdMn-Wo24"

        let fetchURL = URL(string: urlString)



        guard fetchURL != nil else{
            print("Error  fetching books Url")
            return
        }

        let bookDataTask = URLSession.shared.dataTask(with: fetchURL!) { data, response, error in
            guard let data = data else{
                print("Data is nil")
                return
            }
            do{
                let decodedBooks = try JSONDecoder().decode(BooksAPi.self, from: data)
                
                for book in decodedBooks.items{

                    if !book.volumeInfo.previewLink.isEmpty{

                        self.GeneralBooks.append(book)

                    }
                }
                    booksCompletionHandler()
            }catch{
                print("Error decoding the books")
            }


        }
        bookDataTask.resume()


    }


}


