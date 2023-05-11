//
//  ViewController.swift
//  SelectionElements
//
//  Created by Khawaja Abdul Haleem on 11/05/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var maleRB: CheckBox! {
        didSet {
            maleRB.style = .circle
            maleRB.borderStyle = .roundedSquare(radius: 5)
            maleRB.addTarget(self, action: #selector(maleValueChange(_:)), for: .valueChanged)
        }
    }
    
    @IBOutlet weak var femaleRB: CheckBox! {
        didSet {
            femaleRB.style = .circle
            femaleRB.borderStyle = .roundedSquare(radius: 5)
            femaleRB.addTarget(self, action: #selector(femaleValueChange(_:)), for: .valueChanged)
        }
    }
    
    @IBOutlet weak var swiftCB: CheckBox! {
        didSet {
            swiftCB.style = .tick
            swiftCB.borderStyle = .roundedSquare(radius: 5)
            
        }
    }
    
    @IBOutlet weak var fireBaseCB: CheckBox! {
        didSet {
            fireBaseCB.style = .tick
            fireBaseCB.borderStyle = .roundedSquare(radius: 5)
        }
        
    }
    
    @IBOutlet weak var uiUXCB: CheckBox! {
        didSet {
            uiUXCB.style = .tick
            uiUXCB.borderStyle = .roundedSquare(radius: 5)
            
        }
    }
    
    @IBOutlet weak var multiThreadingCB: CheckBox! {
        didSet {
            multiThreadingCB.style = .tick
            multiThreadingCB.borderStyle = .roundedSquare(radius: 5)
        }
    }
    
    @IBOutlet weak var crossOne: CheckBox! {
        didSet {
            crossOne.style = .cross
            crossOne.borderStyle = .roundedSquare(radius: 5)
            
        }
    }
    @IBOutlet weak var crossTwo: CheckBox! {
        didSet {
            crossTwo.style = .cross
            crossTwo.borderStyle = .roundedSquare(radius: 5)
        }
    }
    @IBOutlet weak var crossThree: CheckBox! {
        didSet {
            crossThree.style = .cross
            crossThree.borderStyle = .roundedSquare(radius: 5)
            
        }
    }

    @IBOutlet weak var crossFour: CheckBox! {
        didSet {
            crossFour.style = .cross
            crossFour.borderStyle = .roundedSquare(radius: 5)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
    }
    
    @objc func maleValueChange(_ sender: CheckBox) {
        
        if sender.isChecked {
            femaleRB.isChecked = false
        }
           
       }
    
    @objc func femaleValueChange(_ sender: CheckBox) {
      
        if sender.isChecked{
            maleRB.isChecked = false
        }
         
       }
   
   

}

