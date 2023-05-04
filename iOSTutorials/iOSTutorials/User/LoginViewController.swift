//
//  LoginViewController.swift
//  iOSTutorials
//
//  Created by K.A.Haleem on 01/10/2021.
//  Copyright © 2021 KAH. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
   
    var User = Users()
    let db = APIWrapper()
    
    public static var loggedInUser : Users!
  
    
    @IBOutlet weak var txtPaswrd: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnLogin(_ sender: Any)
    {
        let actionPath = "UserLogin?Mobile=\(txtMobile.text!)&password=\(txtPaswrd.text!)"
            let result =  db.getMethodCall(controllerName: "User", actionName: actionPath)
            
            do{
                if result.ResponseCode == 200 {
                    if let returnData = String(data: result.ResponseData!, encoding: .utf8) {
                        print(returnData)
                        
                        let decoder = JSONDecoder()
                        LoginViewController.loggedInUser = try! decoder.decode(Users.self, from: result.ResponseData!)
                        
                        if LoginViewController.loggedInUser.Role == "Admin" {
                            
                        }
                        print("Login Successfully")
                    }
                }
                else
                {
                    print("Account doestn't exist"+result.ResponseMessage)
                }
        }
    }

}
//                    if LoginViewController.loggedInUser.Role == "Student"{
                        //
                        //                        let controller=storyboard?.instantiateViewController(withIdentifier: "TailorprofileViewController") as! TailorprofileViewController
                        //                        //UserDefaults.standard.set(SigninViewController.loggedInUser.Id, forKey: "id")
                        //                        controller.first = LoginViewController.loggedInUser.FirstName
                        //                        controller.last = LoginViewController.loggedInUser.LastName
                        //                        controller.Contact_no = LoginViewController
                        //                        controller.id = SigninViewController.loggedInUser.Id
                        //                        navigationController?.pushViewController(controller, animated: true)
                        //                        //self.present(controller, animated: true, completion: nil)
                        //
                        //                    }
                        //                    else if LoginViewController.loggedInUser.Role == "Teacher"{
                        //                        let controller=storyboard?.instantiateViewController(withIdentifier: "CustomersViewController") as! CustomersViewController
                        //
                        //                        controller.first = SigninViewController.loggedInUser.FirstName
                        //                        controller.last = SigninViewController.loggedInUser.LastName
                        //                        controller.contact_no = SigninViewController.loggedInUser.Contact_No
                        //                        navigationController?.pushViewController(controller, animated: true)
                        //                        //self.present(controller, animated: true, completion: nil)
                        //
                        //                    }
                        //                    else if LoginViewController.loggedInUser.Role == "Admin"{
                        //                        let controller=storyboard?.instantiateViewController(withIdentifier: "AdminViewController")
                        //                        self.present(controller!, animated: true, completion: nil)
                        //
                        //
                        //                    }
                        
                        

