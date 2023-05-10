//
//  UITabBarController.swift
//  CustomTabBar
//
//  Created by Khawaja Abdul Haleem on 09/05/2023.
//

import UIKit

class CustomTabBarController: UITabBarController {

    
    var upperLineView: UIView!
    
    let spacing: CGFloat = 12

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.delegate = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
    }
    
    ///Add tabbar item indicator uper line
    func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false){
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
            return
        }
        if !isFirstTime{
            upperLineView.removeFromSuperview()
        }
        upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + spacing, y: tabView.frame.minY + 0.1, width: tabView.frame.size.width - spacing * 2, height: 4))
        upperLineView.backgroundColor = UIColor(red: 0.56, green: 0.74, blue: 1.00, alpha: 1.00)
        upperLineView.layer.shadowRadius = 5
        upperLineView.layer.shadowColor = UIColor(red: 0.56, green: 0.74, blue: 1.00, alpha: 1.00).cgColor
        upperLineView.layer.shadowOffset = CGSize.zero
        upperLineView.layer.shadowOpacity = 1
        tabBar.addSubview(upperLineView)
    }
    
    

}

extension CustomTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabbarIndicatorView(index: self.selectedIndex)
    }
}
