//
//  MovieViewController.swift
//  Flix Rate
//
//  Created by Courtney Mixson on 11/23/22.
//

import UIKit

public var selectedGenres:String?
class MovieViewController: UIViewController, UICollectionViewDataSource {
    var selectedGenre:String?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedGenres = selectedGenre
        return manager.numberOfItemsmovie()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        let item = manager.movies(at: indexPath)
         
       
        
        
        cell.lblMovie.text = item.name
        cell.posterMovie.image = UIImage(named: item.poster)
        return cell
        
       
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segue.filmSegue.rawValue:
            showFilmsegue(segue: segue)
        default:
            break

        }
        
    }
    
    func showFilmsegue(segue:UIStoryboardSegue) {
               if let viewController = segue.destination as? FilmViewController,
                  let index = collectionView.indexPathsForSelectedItems?.first {
                   viewController.filmposter = manager.movies(at: index).poster
                   viewController.filmname = manager.movies(at: index).name
                   viewController.imdbfile = manager.movies(at: index).idmb
                   viewController.filmyear = manager.movies(at: index).year
               
               }
           }
    
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    let manager = MovieDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetch()
        
        
    }


}
