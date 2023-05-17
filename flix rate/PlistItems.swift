//
//  PlistItems.swift
//  Flix Rate
//
//  Created by Courtney Mixson on 11/19/22.
//

import Foundation
struct GenreItem{
    var poster:String
    var genre:String
    

    init(dict:[String:AnyObject]) {
        self.poster = dict["poster"] as! String
        self.genre = dict["genre"] as! String
        
    }

}

struct MovieItem{
    var name:String
    var poster:String
    var genre:String
    var year:String
    var idmb:String
    

    init(dict:[String:AnyObject]) {
        self.name = dict["name"] as! String
        self.poster = dict["poster"] as! String
        self.genre = dict["genre"] as! String
        self.year = dict["year"] as! String
        self.idmb = dict["imdb"] as! String
    }
    

}


enum Segue:String {
    case movieSegue
    case filmSegue
    case regularsegue
    case film2019
    case film2020
}

class MovieSearch: NSObject, Decodable {
    var title:String?
    var year:String?
    var imdbID:String?
    var poster:String?
    var type:String?
    
    enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
        case type = "Type"
    }
}
