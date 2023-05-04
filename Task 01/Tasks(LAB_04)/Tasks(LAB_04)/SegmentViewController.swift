//
//  SegmentViewController.swift
//  Tasks(LAB_04)
//
//  Created by Khawaja Abdul Haleem on 24/09/2021.
//

import UIKit

class SegmentViewController: UIViewController {

    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var swicthLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        swicthLabel.backgroundColor = .orange
        
    }
    
    
    @IBAction func swicthPressed(_ sender: UISwitch) {
        if sender.isOn == true {
            swicthLabel.backgroundColor = .green
            swicthLabel.text = "Switch is ON"
        } else {
            swicthLabel.backgroundColor = .gray
            swicthLabel.text = "Swicth is oFF"
        }
    }
    
    @IBAction func segmentControlPressed(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            view.backgroundColor = .red
            
            
        } else if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = .green
            
        } else if sender.selectedSegmentIndex == 2 {
            view.backgroundColor = .blue
            
        } else if sender.selectedSegmentIndex == 3 {
            view.backgroundColor = .orange
        }
    }
    

}
