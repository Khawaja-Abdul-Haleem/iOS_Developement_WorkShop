//
//  BaseViewController.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import UIKit

class BaseViewController: UIViewController {
    private var activityIndicatorView : ActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNibView()
        // Do any additional setup after loading the view.
    }
    
    private func setupNibView(){
        /// Activity Indicator View
        self.activityIndicatorView = UINib(nibName: UINibConstant.ActivityIndicatorNib, bundle: .main).instantiate(withOwner: nil, options: nil).first as? ActivityIndicatorView
        self.activityIndicatorView.frame = self.view.frame
        
    }
    
    internal func showActivityIndicator(){
        self.view.addSubview(activityIndicatorView)
    }
    
    internal func removeActivityIndicator(){
        self.activityIndicatorView.removeFromSuperview()
    }
}
