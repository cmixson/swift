//
//  SearchViewController.swift
//  Flix Rate
//
//  Created by Courtney Mixson on 11/24/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tbTitle:UITextField?
    @IBOutlet weak var tbYear:UITextField?
    @IBOutlet weak var tbType:UITextField?
    var result = ""
    
    @IBAction func onSearch() {
        var title = ""
        var year = ""
        var type = ""
        var apikey = "39c77b5b"

        if(tbTitle != nil) {
            if(tbTitle!.hasText) {
                title = tbTitle!.text!
            }
        }
        
        if(tbYear != nil) {
            if(tbYear!.hasText) {
                year = tbYear!.text!
            }
        }
        
        if(tbType != nil) {
            if(tbType!.hasText) {
                type = tbType!.text!
            }
        }
        
        if title.contains(" ") {
            title = title.replacingOccurrences(of: " ", with: "%20")
        }
        
        let requestURL = "https://www.omdbapi.com/?t=\(title)&y=\(year)&apikey=\(apikey)&type=\(type)"
        
        let url = URL(string: requestURL)
        guard let request_url = url else { fatalError() }
        
        var request = URLRequest(url: request_url)

        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error occured \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                self.result = dataString
            }
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showResult", sender: nil)
            }
            
        }
        task.resume()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let destination = segue.destination as! ResultViewController
            destination.result = self.result
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


