//
//  Utils.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import Foundation
import UIKit

class Utils {
    
    static public func showErrorAlert(vc:UIViewController){
        let alert = UIAlertController(title: "Alert", message: "NOT FOUND", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        vc.present(alert, animated: true)
    }
    
    static public func showSuccessAlert(vc:UIViewController){
        let alert = UIAlertController(title: "Alert", message: "Success", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        vc.present(alert, animated: true)
    }
}
