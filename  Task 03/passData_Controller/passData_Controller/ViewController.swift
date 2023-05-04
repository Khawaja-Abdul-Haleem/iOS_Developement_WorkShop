//
//  ViewController.swift
//  passData_Controller
//
//  Created by Khawaja Abdul Haleem on 25/09/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fieldOne: UITextField!
    
    @IBOutlet weak var fieldTwo: UITextField!
    
    var res = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func showBtnPressed(_ sender: UIButton) {
        res = Int(fieldOne.text!)! + Int(fieldTwo.text!)!
    
        print(res)
        
        performSegue(withIdentifier: "resultVIew", sender: self)
        
//        let detail = storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
//        detail.result = String(res)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var detail = segue.destination as! ResultViewController
        detail.result = String(res)
        
    }
    

    
    
}

