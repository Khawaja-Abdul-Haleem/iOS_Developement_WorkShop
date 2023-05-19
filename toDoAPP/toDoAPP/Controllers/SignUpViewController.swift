//
//  SignInViewController.swift
//  toDoAPP
//
//  Created by Khawaja Abdul Haleem on 17/05/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
   
    let mCoreDataManager = CoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! MainViewController
        destinationVC.name = nameField.text!
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        if nameField.text != "" {
            performSegue(withIdentifier: "signUpToMain", sender: nil)
        }
      
        
    }
    
    
    
}
