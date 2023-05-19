//
//  Extensions.swift
//  toDoAPP
//
//  Created by Khawaja Abdul Haleem on 19/05/2023.
//

import Foundation
import UIKit

extension Date {
    var dateComponents: DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        let dateComponenets = calendar.dateComponents([.year, .month, .day, .second, .minute, .hour], from: self)
        return dateComponenets
    }
    var second: Int {
        return dateComponents.second ?? 0
    }
    var minute: Int {
        return dateComponents.minute ?? 0
    }
    var hour: Int {
        return dateComponents.hour ?? 0
    }
}

extension UIImageView {
    func imageAsCircleWithBorder(borderColor : UIColor, strokeWidth: CGFloat)
    {
        var radius = min(self.bounds.width, self.bounds.height)
        var drawingRect : CGRect = self.bounds
        drawingRect.size.width = radius
        drawingRect.origin.x = (self.bounds.size.width - radius) / 2
        drawingRect.size.height = radius
        drawingRect.origin.y = (self.bounds.size.height - radius) / 2

        radius /= 2

        var path = UIBezierPath(roundedRect: drawingRect.insetBy(dx: strokeWidth/2, dy: strokeWidth/2), cornerRadius: radius)
        let border = CAShapeLayer()
        border.fillColor = UIColor.clear.cgColor
        border.path = path.cgPath
        border.strokeColor = borderColor.cgColor
        border.lineWidth = strokeWidth
        self.layer.addSublayer(border)

        path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        
    }
}
