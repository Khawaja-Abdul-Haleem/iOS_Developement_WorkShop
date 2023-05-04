//
//  ViewController.swift
//  tableView_with_Image
//
//  Created by Khawaja Abdul Haleem on 25/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tbleView: UITableView!
    
    var name = ["K.A.H", "Salman Khan", "Hrithic Roshan", "Akshay Kumar", "Roman Reign"]
    
    var status = ["Student", "Actor", "Actor", "Actor", "Wrestler"]
    
    var nameImg = [#imageLiteral(resourceName: "KAH"), #imageLiteral(resourceName: "salman"), #imageLiteral(resourceName: "hrithic"), #imageLiteral(resourceName: "akshay"), #imageLiteral(resourceName: "roman")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tbleView.delegate = self
        tbleView.dataSource = self
        
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 146
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.nameLabel.text = name[indexPath.row]
        cell.statusLabel.text = status[indexPath.row]
        cell.imgUI.image = nameImg[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail =  storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        
        detail.strName = name[indexPath.row]
        detail.strStatus = status[indexPath.row]
        detail.strImg = nameImg[indexPath.row]
        
        navigationController?.pushViewController(detail, animated: true)
    }
    
    //for deleting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            name.remove(at: indexPath.row)
            status.remove(at: indexPath.row)
            nameImg.remove(at: indexPath.row)
            tbleView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
