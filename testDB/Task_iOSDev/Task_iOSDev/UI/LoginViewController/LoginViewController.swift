//
//  LoginViewController.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import UIKit

class LoginViewController: BaseViewController {
   
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    
    var mUserViewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setFields()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("Typing")
        emailError.isHidden = true
        passwordError.isHidden = true
    }
   
    private func setFields() {
        userName.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: .editingChanged)
        password.addTarget(self, action: #selector(LoginViewController.textFieldDidChange(_:)), for: .editingChanged)
       
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if userName.text! == "" {
            emailError.isHidden = false
            emailError.text = StringConstants.signInEmailValidation
            return
        }
        
        if password.text! == "" {
            passwordError.isHidden = false
            passwordError.text = StringConstants.signInPasswordValidation
            return
        }
        
        if userName.text!.isValidEmail() != true {
            // invalid Email
            emailError.isHidden = false
            emailError.text = StringConstants.emailValidation
            return
        }
        
       self.showActivityIndicator()
       let result = mUserViewModel.loginUSer(email: userName.text!, Password: password.text!) { status in
           
           if status == false {
                // error
                DispatchQueue.main.async {
                    self.removeActivityIndicator()
                    Utils.showErrorAlert(vc: self)
                }
            } else {
                // success
                self.removeActivityIndicator()
                Utils.showSuccessAlert(vc: self)
                
            }
        }
        print(result)

        
    }
}
