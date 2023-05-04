//
//  ViewController.swift
//  testDataBase
//
//  Created by Khawaja Abdul Haleem on 25/09/2021.
//

import UIKit

class ViewController: UIViewController {

    var students = [Student]()
    
    @IBOutlet weak var rollNoLabel: UITextField!
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var desciplineLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let db = DatabaseHandler()
        students = db.getStudents()
        
        let query = "insert into Student(rollNo,name,descipline) values('\(rollNoLabel.text)', '\(nameLabel.text)', '\(desciplineLabel.text)')"
        
        //db.executeQuery(query: query)
        
        db.executeSelect(query: query)
        
        
       // db.prepareDatafile()
  
    }
    
}

