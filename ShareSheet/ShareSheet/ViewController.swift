//
//  ViewController.swift
//  ShareSheet
//
//  Created by Khawaja Abdul Haleem on 16/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareLocationButtonTapped(_ sender: UIButton) {
        let latitude = 39.173209
        let longitude = -94.593933
        if let url = URL(string: "https://maps.apple.com?ll=\(latitude),\(longitude)") {
            let activity = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            self.present(activity, animated: true)
        }
        
        
    }
   
    @IBAction func openSafari(_ sender: UIButton) {
        
        guard let url = URL(string: "https://github.com/Khawaja-Abdul-Haleem") else { return }
        UIApplication.shared.open(url)
    }
    
    
    @IBAction func openCustomControllerTaped(_ sender: UIButton) {
        let vc = CustomModalViewController()
        vc.modalPresentationStyle = .overCurrentContext
        // keep false
        // modal animation will be handled in VC itself
        self.present(vc, animated: false)
    }
    
}

