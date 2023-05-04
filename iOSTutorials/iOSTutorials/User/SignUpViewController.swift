//
//  SignUpViewController.swift
//  iOSTutorials
//
//  Created by Sadia on 01/10/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    var User = user()
   
    @IBOutlet weak var segRole: UISegmentedControl!
    @IBOutlet weak var segGender: UISegmentedControl!
    @IBOutlet weak var txtPaswrd: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtLname: UITextField!
    @IBOutlet weak var txtfname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnRegister(_ sender: Any)
    {
       
       User.FirstName = txtfname.text
       User.LastName = txtLname.text
       User.Mobile = txtMobile.text
       User.Password = txtPaswrd.text
        
        if segGender.selectedSegmentIndex == 0
        {
            User.Gender = "Male"
        }
        else
        {
            User.Gender = "Female"
        }
        if segRole.selectedSegmentIndex == 0
        {
            User.Role = "Teacher"
        }
        else if segRole.selectedSegmentIndex == 1
        {
            User.Role = "Admin"
        }
        else
        {
            User.Role = "Student"
        }
        let encoder = JSONEncoder()
        let data = try! encoder.encode (User)
        var db = APIWrapper();
        var result = db.postMethodCall(controllerName: "User", actionName: "addUser", httpBody: data)
        
        print("Successfully Created Account No you can login")
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(controller!,animated: true,completion: nil)
    }
    //else
    //{
    // Globals.showDefaultAlert(sender: self, title: "SignUp!", message: "Password didn't match")
    // }
    
    
    
    
}
