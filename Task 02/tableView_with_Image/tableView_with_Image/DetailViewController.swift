//
//  DetailViewController.swift
//  tableView_with_Image
//
//  Created by Khawaja Abdul Haleem on 25/09/2021.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailName: UILabel!
    
    @IBOutlet weak var detailStatus: UILabel!
    
    @IBOutlet weak var detailImg: UIImageView!
    
    var strName : String!
    var strStatus : String!
    var strImg : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailName.text = strName
        detailStatus.text = strStatus
        detailImg.image = strImg
    }
    


}
