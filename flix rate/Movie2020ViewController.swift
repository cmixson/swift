//
//  Movie2020ViewController.swift
//  Flix Rate
//
//  Created by Courtney Mixson on 11/25/22.
//

import UIKit

class Movie2020ViewController: UIViewController, UICollectionViewDataSource {

    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return manager.numberOfItemsmovie2020()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie2020Cell", for: indexPath) as! Movie2020Cell
        let item = manager.movies2020(at: indexPath)
         
        cell.lblMovie2020.text = item.name
        cell.posterMovie2020.image = UIImage(named: item.poster)
        
                return cell
        
       
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segue.film2020.rawValue:
            show2020segue(segue: segue)
        default:
            break

        }
        
    }
    func show2020segue(segue:UIStoryboardSegue) {
               if let viewController = segue.destination as? FilmViewController,
                  let index = collectionView.indexPathsForSelectedItems?.first {
                   viewController.filmposter = manager.movies2020(at: index).poster
                   viewController.filmname = manager.movies2020(at: index).name
                   viewController.imdbfile = manager.movies2020(at: index).idmb
                   viewController.filmyear = manager.movies2020(at: index).year
                   
               }
           }
    
    
    @IBOutlet weak var collectionView: UICollectionView!

   
    let manager = MovieDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetch()
        
        
    }


}
