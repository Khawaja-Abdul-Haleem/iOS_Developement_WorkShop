//
//  CustomTabBarController.swift
//  Task_iOSDev
//
// Created by Khawaja Abdul Haleem on 24/10/2022.
//



import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let url = URL(string: "https://i.pinimg.com/236x/d0/87/c0/d087c052a68265fee8861d6350e5e47d.jpg") else { return }
        let data = try! Data(contentsOf: url)
        let image = UIImage(data: data)!
        let resized = resizeImage(image: image.circleMasked ?? UIImage(), targetSize: CGSize(width: 20, height: 20))?.withRenderingMode(.alwaysOriginal)
        tabBar.items![0].image = resized
        tabBar.items![1].image = resized
       
       
    }

    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

}
