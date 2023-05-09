//
//  AlertWithOkButton.swift
//  CustomAlert
//
//  Created by Khawaja Abdul Haleem on 09/05/2023.
//

import Foundation
import UIKit

protocol AlertWithOkButtonProtocol {
    func oKButtonTapped()
}

class AlertWithOkButton: UIView {
    let nibName = "AlertWithOkButton"
    var contentView: UIView?
    
    var delegate: AlertWithOkButtonProtocol?
    
    @IBOutlet var alertViewMain: UIView! 
    @IBOutlet weak var nameLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
        
    }
    
    
    @IBAction func oKButtonTapped(_ sender: Any) {
        delegate?.oKButtonTapped()
    }
    
}
