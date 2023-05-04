//
//  ResultViewController.swift
//  passData_Controller
//
//  Created by Khawaja Abdul Haleem on 25/09/2021.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var resultLabel: UILabel!
    
    var result : String!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resultLabel.text = result
    }
   

}
