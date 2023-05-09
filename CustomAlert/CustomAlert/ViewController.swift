//
//  ViewController.swift
//  CustomAlert
//
//  Created by Khawaja Abdul Haleem on 09/05/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var alertWithOkButton: AlertWithOkButton!
    
    @IBOutlet weak var introView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialSetup()
    }

    @IBAction func displayAlert(_ sender: UIButton) {
        alertWithOkButton.nameLabel.text = nameField.text
     
        self.alertWithOkButton.isHidden = false
       
        UIView.animate(withDuration: 1.5, delay: 0.2, options: .curveEaseOut) {
            
            self.alertWithOkButton.alertViewMain.alpha = 1.0
        }

            introView.isHidden = true
        
    }
    
    private func initialSetup() {
        alertWithOkButton.delegate = self
        alertWithOkButton.alertViewMain.backgroundColor = UIColor(red: 0.56, green: 0.74, blue: 1.00, alpha: 0.5)
        self.alertWithOkButton.alertViewMain.alpha = 0.0
    }
    
}

extension ViewController: AlertWithOkButtonProtocol {
    func oKButtonTapped() {
       
        alertWithOkButton.isHidden = true
        introView.isHidden = false
        self.alertWithOkButton.alertViewMain.alpha = 0.0
    }
    
    
}

