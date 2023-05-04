//
//  SecondViewController.swift
//  iOSTutorials
//
//  Created by Sadia on 22/09/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var show: String?
    @IBOutlet weak var lblshow: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblshow.text = show
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
