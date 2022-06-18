//
//  Model.swift
//  TakeItEasyProject
//
//  Created by Liban Abdinur on 6/16/22.
//

import Foundation

struct BooksAPi: Codable{
    var kind: String
    var items: [Books]
   
}

struct Books: Codable{
    var kind, id, etag, selfLink: String
    var volumeInfo: BookDetails
    var accessInfo: AccessInfo
}
struct BookDetails: Codable{
    
    var title: String
    var authors: [String]
    var publisher, publishedDate, description: String?
   // var industryIdentifiers: [IndustryIdentifiers]
   // var readingModes: ReadingModes
    var pageCount: Int?
   // var printType: String
    var categories: [String]?
    //var maturityRating: [String]
    var imageLinks: ImageLinks
    var previewLink: String
}

//struct IndustryIdentifiers: Codable{
  //  var type, identifier: String
//}
struct ImageLinks: Codable{
    var smallThumbnail, thumbnail: String
}
//struct ReadingModes: Codable{
  //  var text, image: Bool
//}
struct AccessInfo: Codable{
    var webReaderLink: String
}


