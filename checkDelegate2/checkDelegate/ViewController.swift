//
//  ViewController.swift
//  checkDelegate
//
//  Created by Khawaja Abdul Haleem on 14/02/2023.
//

import UIKit

protocol SendDataToOther {
    func movieData() -> String
}

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var moviesArrys = ["Movie_1", "Movie_2", "Movie_3", "Movie_4", "Movie_5"]
    var senderString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recieverScreen = segue.destination as? RevieverViewController {
            recieverScreen.delegate = self
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = moviesArrys[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("in didselctRowAt: tag: \(indexPath.row)")
      
        senderString = moviesArrys[indexPath.row]
     
        performSegue(withIdentifier: "goToRecieverVC", sender: nil)
        
    }
    
}

extension ViewController: SendDataToOther {
    func movieData() -> String {
        return senderString
    }
    

}
