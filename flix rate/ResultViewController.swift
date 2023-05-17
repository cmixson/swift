//
//  ResultViewController.swift
//  Flix Rate
//
//  Created by Courtney Mixson on 11/24/22.
//

import UIKit
import SafariServices


class ResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var imdbsearch: String?
    var movies:[MovieSearch] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultcell", for: indexPath) as! ResultCell
        
        let movie = movies[indexPath.item]
        
        cell.lbTitle?.text = movie.title
        cell.lbYear?.text = movie.year
        cell.lbtype?.text = movie.type
        imdbsearch = "https://www.imdb.com/title/\(movie.imdbID!)/"
        if movie.poster != "N/A" && movie.poster != nil {
            let url = URL(string: movie.poster!)
            let data = try? Data(contentsOf: url!)

            if let imageData = data {
                let image = UIImage(data: imageData)
                cell.imgPoster?.image = image
            }
        }
        
        
        return cell
    }
    
    
    @IBAction func imdbbutton2(_ sender: UIButton) {
        let imdbcontroller2 = SFSafariViewController(url: URL(string: imdbsearch!)!)
        present (imdbcontroller2, animated: true)
    }
    
    var result:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if result != nil {
            do {
                let data = result?.data(using: .utf8)
                let movies = try JSONDecoder().decode([MovieSearch].self, from: data!)
                //movies.append(movie);
            }catch {
                
                do {
                    let data = result?.data(using: .utf8)
                    let movie = try JSONDecoder().decode(MovieSearch.self, from: data!)
                    movies.append(movie)
                } catch {
                    print("There is an error/errors")
                }
            }
            
        }

    }

}
