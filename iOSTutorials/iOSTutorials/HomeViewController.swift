//
//  HomeViewController.swift
//  iOSTutorials
//
//  Created by Sadia on 19/09/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblshow: UILabel!
    @IBOutlet weak var txtone: UITextField!
    
    @IBOutlet weak var txttwo: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func btnSubmit(_ sender: Any) {
        
       // lblshow.text = txtone.text!+txttwo.text!
        var result = Int(txtone.text!)!+Int(txttwo.text!)!
        lblshow.text = String(result)
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        controller.show = String(result)
        self.present(controller,animated: true, completion: nil)
        
    }
    
  //  @IBAction func btnSubmit(_ sender: Any) {
      //  if txtone.text?.isEmpty == false
      //  {
         //   print(txtone.text)
          //  print(txttwo.text)
          //  let label1 = txtone.text!+txttwo.text!
           // print(label1)
           // lblShow.text = txttwo.text!+txttwo.text!
          //  var result = Int(txtone.text!)!+Int(txttwo.text!)!
            //lblShow.text = String(result)
          //  let controller = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            //controller.lblshow.text = String(result)
         //   controller.show = String(result)
          //  self.present(controller, animated: true, completion: nil)
            
            
        }
        
        
        
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


