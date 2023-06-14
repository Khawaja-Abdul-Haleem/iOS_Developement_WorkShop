//
//  ViewController.swift
//  addCheckBox
//
//  Created by Khawaja Abdul Haleem on 13/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lineWidth: NSLayoutConstraint!
    
    @IBOutlet weak var checkBox: UIButton!
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var lineTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var mainView: UIView!
    var isCheck = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if isCheck == false {
            checkBox.setImage( UIImage(named: "checkTask"), for: .normal)
  
            self.lineWidth.constant = 500//view.safeAreaInsets.right
        
            UIView.animate(withDuration: 3.0, animations: { // 3.0 are the seconds

            // Write your code here for e.g. Increasing any Subviews height.

            self.view.layoutIfNeeded()

            })
            
            
            isCheck = true
        } else {
            checkBox.setImage( UIImage(named: "uncheckTask"), for: .normal)
        
            self.lineWidth.constant = 10
        
            UIView.animate(withDuration: 3.0, animations: { // 3.0 are the seconds

            // Write your code here for e.g. Increasing any Subviews height.

            self.view.layoutIfNeeded()

            })
            
            isCheck = false
        }
        
    }
    
}

