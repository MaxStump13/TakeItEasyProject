import UIKit

class BooksViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate{
    
    var offline = ["Knights", "Percy Jackson", "Tom Clancy Line of Sight", "Goosebumps Night In The Woods"]
    var coverImg = ["Knights","luffy","jets","history"]
    var GeneralBooks:[Books] = []
    var TechBooks:[Books] = []
    var CookBooks:[Books] = []
    var searchTerms: String?
    
    @IBOutlet weak var GeneralBooksCollection: UICollectionView!
    @IBOutlet weak var TechBooksCollection: UICollectionView!
    @IBOutlet weak var CookBooksCollection: UICollectionView!
    @IBOutlet weak var SearchBar: UISearchBar!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == GeneralBooksCollection {
            return filteredGeneralBooks.count
        } else if collectionView == TechBooksCollection {
            return filteredTechBooks.count
        } else if collectionView == CookBooksCollection {
            return filteredCookBooks.count
        }
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == GeneralBooksCollection {
            let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCell", for: indexPath) as! GeneralBookCollectionViewCell
            bookCell.layer.cornerRadius = 5.0
            bookCell.layer.masksToBounds = true
            //bookCell.backgroundColor = .yellow
            bookCell.nameA.text = filteredGeneralBooks[indexPath.row].volumeInfo.title
            if let imageUrl = URL(string: filteredGeneralBooks[indexPath.row].volumeInfo.imageLinks.thumbnail),
               let data = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        bookCell.ImageBackground.image = image
                    }
                }
            }
       
            return bookCell
        } else if collectionView == TechBooksCollection {
            let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TechCell", for: indexPath) as! TechBookCollectionViewCell
            bookCell.layer.cornerRadius = 5.0
            bookCell.layer.masksToBounds = true
            //bookCell.backgroundColor = .yellow
            bookCell.nameB.text = filteredTechBooks[indexPath.row].volumeInfo.title
            if let imageUrl = URL(string: filteredTechBooks[indexPath.row].volumeInfo.imageLinks.thumbnail),
               let data = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        bookCell.ImageBackground.image = image
                    }
                }
            }

            return bookCell
        } else if collectionView == CookBooksCollection {
            let bookCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CookCell", for: indexPath) as! CookBookCollectionViewCell
            bookCell.layer.cornerRadius = 5.0
            bookCell.layer.masksToBounds = true
            //bookCell.backgroundColor = .yellow
            bookCell.nameC.text = filteredCookBooks[indexPath.row].volumeInfo.title
            if let imageUrl = URL(string: filteredCookBooks[indexPath.row].volumeInfo.imageLinks.thumbnail),
               let data = try? Data(contentsOf: imageUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        bookCell.ImageBackground.image = image
                    }
                }
            }
            return bookCell
        }
      
        print("There was an error: didn't find a match for the collection view")
        return collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCell", for: indexPath) as! GeneralBookCollectionViewCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let storyObject = UIStoryboard(name: "Main", bundle: nil)
        let bookWebController = storyObject.instantiateViewController(withIdentifier: "web") as! BookWebViewController

          if collectionView == GeneralBooksCollection {
            bookWebController.bookName = filteredGeneralBooks[indexPath.row].volumeInfo.previewLink
        } else if collectionView == TechBooksCollection {
            bookWebController.bookName = filteredTechBooks[indexPath.row].volumeInfo.previewLink
        } else if collectionView == CookBooksCollection {
            bookWebController.bookName = filteredCookBooks[indexPath.row].volumeInfo.previewLink
        }

        navigationController?.pushViewController(bookWebController, animated: true)

    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerms = searchText != "" ? searchText: nil
        DispatchQueue.main.async {
            self.GeneralBooksCollection.reloadData()
            self.CookBooksCollection.reloadData()
            self.TechBooksCollection.reloadData()
        }
    }
    
    var filteredGeneralBooks: [Books]{
        if let searchTerms = searchTerms {
            return GeneralBooks.filter({$0.volumeInfo.title.lowercased().contains(searchTerms.lowercased())})
        }else{
            return GeneralBooks
        }
    }
    var filteredTechBooks: [Books]{
        if let searchTerms = searchTerms {
            return TechBooks.filter({$0.volumeInfo.title.lowercased().contains(searchTerms.lowercased())})
        }else{
            return TechBooks
        }
    }
    var filteredCookBooks: [Books]{
        if let searchTerms = searchTerms {
            return CookBooks.filter({$0.volumeInfo.title.lowercased().contains(searchTerms.lowercased())})
        }else{
            return CookBooks
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Design Elements
        let front = Design()
        view.layer.insertSublayer((front.gradient(boundary: view)), at: 0)
        
        // Cook books
        fetchBooks(urlString: "https://www.googleapis.com/books/v1/volumes?&q=cookpdf&key=AIzaSyDFPkdgwDotfduJ8MH-QR128RNdMn-Wo24") { books in
            self.CookBooks = books
            DispatchQueue.main.async {
               self.CookBooksCollection.reloadData()
            }
        }
        // Tech books
        fetchBooks(urlString: "https://www.googleapis.com/books/v1/volumes?&q=techpdf&key=AIzaSyDFPkdgwDotfduJ8MH-QR128RNdMn-Wo24") { books in
            self.TechBooks = books
            DispatchQueue.main.async {
               self.TechBooksCollection.reloadData()
            }
        }
        // General books
        fetchBooks(urlString: "https://www.googleapis.com/books/v1/volumes?&q=genpdf&key=AIzaSyDFPkdgwDotfduJ8MH-QR128RNdMn-Wo24") { books in
            self.GeneralBooks = books
            DispatchQueue.main.async {
               self.GeneralBooksCollection.reloadData()
            }
        }
    }
    
    func fetchBooks(urlString: String, booksCompletionHandler: @escaping(_ books:[Books]) -> ()){
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
                var books:[Books] = []
                for book in decodedBooks.items{
                    if !book.volumeInfo.previewLink.isEmpty{
                        books.append(book)
                    }
                }
                // hand the books that we decoded back to the calling code
                booksCompletionHandler(books)
            }catch let e as Error{
                print("Error decoding the books \(e)")
            }
        }
        bookDataTask.resume()
    }
}
