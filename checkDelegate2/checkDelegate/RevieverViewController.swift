//
//  RevieverViewController.swift
//  checkDelegate
//
//  Created by Khawaja Abdul Haleem on 14/02/2023.
//

import UIKit


class RevieverViewController: UIViewController {
    
    var delegate: SendDataToOther?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        let movieString = self.delegate?.movieData()
        print("MovieString : \(movieString)")
    }
   
}


