//
//  FilmViewController.swift
//  Flix Rate
//
//  Created by Courtney Mixson on 11/23/22.
//

import UIKit
import SafariServices
class FilmViewController: UIViewController {
    var filmname: String?
    var filmposter: String?
    var imdbfile: String?
    var filmyear: String?
        override func viewDidLoad() {
        super.viewDidLoad()
        lblFilm.text = filmname
        posterFilm.image = UIImage(named: filmposter!)
        lblYear.text = filmyear
        
    }
    @IBOutlet var lblFilm:UILabel!
    @IBOutlet var posterFilm:UIImageView!
    @IBOutlet var lblYear:UILabel!
    
    
    
    @IBAction func imdbbutton(_ sender: UIButton) {
        let imdbcontroller = SFSafariViewController(url: URL(string: imdbfile!)!)
        present (imdbcontroller, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
