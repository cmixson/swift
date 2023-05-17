//
//  Movie2019ViewController.swift
//  Flix Rate
//
//  Created by Courtney Mixson on 11/25/22.
//

import UIKit

class Movie2019ViewController: UIViewController, UICollectionViewDataSource {

    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return manager.numberOfItemsmovie2019()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie2019Cell", for: indexPath) as! Movie2019Cell
        let item = manager.movies2019(at: indexPath)
         
        cell.lblMovie2019.text = item.name
        cell.posterMovie2019.image = UIImage(named: item.poster)
        
                return cell
        
       
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segue.film2019.rawValue:
            show2019segue(segue: segue)
        default:
            break

        }
        
    }
    func show2019segue(segue:UIStoryboardSegue) {
               if let viewController = segue.destination as? FilmViewController,
                  let index = collectionView.indexPathsForSelectedItems?.first {
                   viewController.filmposter = manager.movies2019(at: index).poster
                   viewController.filmname = manager.movies2019(at: index).name
                   viewController.imdbfile = manager.movies2019(at: index).idmb
                   viewController.filmyear = manager.movies2019(at: index).year
               
               }
           }
    
    @IBOutlet weak var collectionView: UICollectionView!

   
    let manager = MovieDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetch()
        
        
    }


}
