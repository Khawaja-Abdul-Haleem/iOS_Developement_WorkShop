//
//  Utilities.swift
//  iOSTutorials
//
//  Created by Sadia on 06/10/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import Foundation
import UIKit

class Utilities
{
    public static func getImageFromURL(name:String)->UIImage?
    {
        let _url = URL(string:"http://192.168.10.9/Demo/Pictures/\(name)")
        guard let url = _url else {
            return nil
        }
        let _data = try? Data(contentsOf: url)
        guard let data = _data else {
            return nil
        }
        let image = UIImage(data: data)
        return image
    }
}
