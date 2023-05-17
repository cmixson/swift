//
//  DataManaget.swift
//  Flix Rate
//
//  Created by Courtney Mixson on 11/19/22.
//

import Foundation
class MovieDataManager{
    
    fileprivate var items:[MovieItem] = []
    var filteritems:[MovieItem] = []
    
    
    

    func fetch() {
        for data in loadData() {
            
            items.append(MovieItem(dict: data))
            
            
        }
        
    }

    func numberOfItemsmovie() -> Int {
        return items.filter({ ($0.genre.contains(selectedGenres!)) }).count
    }
    
    func numberOfItemsmovie2019() -> Int {
        return items.filter({ ($0.genre.contains(selectedGenres!)) && ($0.year.contains("2019")) }).count
    }
    
    func numberOfItemsmovie2020() -> Int {
        return items.filter({ ($0.genre.contains(selectedGenres!)) && ($0.year.contains("2020")) }).count
    }
    
    func movies(at index:IndexPath) -> MovieItem {
        
        return items.filter({ ($0.genre.contains(selectedGenres!)) })[index.item]
    }
    func movies2019(at index:IndexPath) -> MovieItem {
        
        return items.filter({ ($0.genre.contains(selectedGenres!) && ($0.year.contains("2019"))) })[index.item]
    }
    func movies2020(at index:IndexPath) -> MovieItem {
        
        return items.filter({ ($0.genre.contains(selectedGenres!) && ($0.year.contains("2020"))) })[index.item]
    }

    fileprivate func loadData() -> [[String: AnyObject]]{
        guard let path = Bundle.main.path(forResource: "movies", ofType: "plist"),
              let items = NSArray(contentsOfFile: path) else {
                  return [[:]]
        }
        
        return items as! [[String : AnyObject]]
    }
    
}

class GenreDataManager{
    
    fileprivate var items:[GenreItem] = []

    func fetch() {
        for data in loadData() {
            items.append(GenreItem(dict: data))
            
        }
    }

    func numberOfItemsgenres() -> Int {
        return items.count
    }
    
    func genres(at index:IndexPath) -> GenreItem {
        return items[index.item]
    }

    fileprivate func loadData() -> [[String: AnyObject]]{
        guard let path = Bundle.main.path(forResource: "Genres", ofType: "plist"),
              let items = NSArray(contentsOfFile: path) else {
                  return [[:]]
        }
        
        return items as! [[String : AnyObject]]
        
    }
}


