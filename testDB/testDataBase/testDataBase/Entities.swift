//
//  Entities.swift
//  CookingRecipeApp
//
//  Created by BIIT on 14/03/2020.
//  Copyright © 2020 BIIT. All rights reserved.
//

import Foundation
import UIKit

//class Category{
//    var CatID : Int = 0
//    var Name : String = ""
//    var Picture : UIImage? = nil
//}

class Student {
    var id : Int = 0
    var rollNo : String = ""
    var name : String = ""
    var descipline : String = ""
}




//extension UIImage {
//    func resizeImage(_ dimension: CGFloat, opaque: Bool, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImage {
//        var width: CGFloat
//        var height: CGFloat
//        var newImage: UIImage
//
//        let size = self.size
//        let aspectRatio =  size.width/size.height
//
//        switch contentMode {
//            case .scaleAspectFit:
//                if aspectRatio > 1 {                            // Landscape image
//                    width = dimension
//                    height = dimension / aspectRatio
//                } else {                                        // Portrait image
//                    height = dimension
//                    width = dimension * aspectRatio
//                }
//
//        default:
//            fatalError("UIIMage.resizeToFit(): FATAL: Unimplemented ContentMode")
//        }
//
//        if #available(iOS 10.0, *) {
//            let renderFormat = UIGraphicsImageRendererFormat.default()
//            renderFormat.opaque = opaque
//            let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
//            newImage = renderer.image {
//                (context) in
//                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
//            }
//        } else {
//            UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), opaque, 0)
//                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
//                newImage = UIGraphicsGetImageFromCurrentImageContext()!
//            UIGraphicsEndImageContext()
//        }
//
//        return newImage
//    }
//}
