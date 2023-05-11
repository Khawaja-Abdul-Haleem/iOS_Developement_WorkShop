//
//  ViewController.swift
//  SelectionElements
//
//  Created by Khawaja Abdul Haleem on 11/05/2023.
//

import UIKit
import Foundation

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
    
    
    
    @IBOutlet weak var textOneLine: UILabel!
    
    var isChecked = false
    var imageAttachment = NSTextAttachment()
    let imageOffsetY: CGFloat = -5.0
    var attachmentString: NSAttributedString = NSAttributedString()
    var completeText: NSMutableAttributedString = NSMutableAttributedString()
    var textAfterIcon: NSAttributedString = NSAttributedString()
    
    let descriptionText = "Check The Box to indicate that you are atleast 18 years of age, agree to Term and condition and privacyPolicy."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        initialSetup()
        
    }
    
    @objc func userTappedOnLink() {
        if isChecked == false {
            setImageToLabel(imageName: "checked", emptySpace: " ")
            
            isChecked = true
        } else {
          
            setImageToLabel(imageName: "unchecked", emptySpace: "")
            isChecked = false
        }
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
   
    func initialSetup() {
        
         setImageToLabel(imageName: "unchecked", emptySpace: "")
       
         let gesture = UITapGestureRecognizer(target: self, action: #selector(userTappedOnLink))
         // if labelView is not set userInteractionEnabled, you must do so
         textOneLine.isUserInteractionEnabled = true
         textOneLine.addGestureRecognizer(gesture)
    }
    
    func setImageToLabel(imageName: String, emptySpace: String) {
        imageAttachment.image = UIImage(named: imageName)
        // Set bound to reposition

        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: 30, height: 30)
        // Create string with attachment
         attachmentString = NSAttributedString(attachment: imageAttachment)
        // Initialize mutable string
        completeText = NSMutableAttributedString(string: emptySpace)
        // Add image to mutable string
        completeText.append(attachmentString)
        // Add your text to mutable string
        textAfterIcon = NSAttributedString(string: descriptionText)
        completeText.append(textAfterIcon)
        self.textOneLine.textAlignment = .left
        self.textOneLine.attributedText = completeText
    }
   

}

