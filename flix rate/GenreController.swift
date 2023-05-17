//
//  GenreController.swift
//  Flix Rate
//
//  Created by Courtney Mixson on 11/19/22.
//

import UIKit


class GenreController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.numberOfItemsgenres()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as! GenreCell
        let item = manager.genres(at: indexPath)
        
        cell.lblGenre.text = item.genre
        cell.postergenre.image = UIImage(named: item.poster)
        return cell
        
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Segue.movieSegue.rawValue:
            showMoviesegue(segue: segue)
        default:
            print("Segue not added")
        }
        
    }
    func showMoviesegue(segue:UIStoryboardSegue) {
               if let viewController = segue.destination as? MovieViewController,
                  let index = collectionView.indexPathsForSelectedItems?.first {
                   viewController.selectedGenre = manager.genres(at: index).genre
               
               }
           }

    @IBOutlet weak var collectionView: UICollectionView!
    let manager = GenreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.fetch()
        
        
    }


}
