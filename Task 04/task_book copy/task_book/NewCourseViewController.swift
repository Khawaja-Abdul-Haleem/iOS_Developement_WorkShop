////
////  NewCourseViewController.swift
////  iOSTutorials
////
////  Created by Sadia on 15/10/2021.
////  Copyright © 2021 Sadia. All rights reserved.
////
//
//import UIKit
//
//class NewCourseViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    
//    @IBOutlet weak var imgcover: UIImageView!
//    @IBOutlet weak var txtBook: UITextField!
//    @IBOutlet weak var txtPrice: UITextField!
//    @IBOutlet weak var txtTitle: UITextField!
//    @IBOutlet weak var txtAuthor: UITextField!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//    
//
//    @IBAction func btnBrowse(_ sender: Any)
//    {
//        let imagep = UIImagePickerController()
//        imagep.delegate = self
//        // imagep.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
//        
//        
//        
//        imagep.sourceType = UIImagePickerController.SourceType.photoLibrary
//        imagep.allowsEditing = false
//        self.present(imagep,animated: true)
//        {
//            //any message to show
//        }
//    }
//   
//    @IBAction func btnSave(_ sender: Any)
//    {
//        let saveCourse = Course()
//        saveCourse.author = txtAuthor.text
//        saveCourse.book = txtBook.text
//        saveCourse.price = Int(txtPrice.text!)
//        saveCourse.title = txtTitle.text
//        
//        let api = APIWrapper()
//        let imgdata = imgcover.image?.pngData()
//
//        let result1 = api.UploadImageMethodCall(cJson: imgdata!, endPoint: "User/UploadImage")
//         var imgname = result1.ResponseMessage
//        if result1.ResponseCode == 200 {
//            imgname = String(data: result1.ResponseData!, encoding: .utf8)!
//        }
//      //  foodimg.image = "imgname"
//        let encoder = JSONEncoder()
//        saveCourse.Cimage = imgname
//        let data = try! encoder.encode(saveCourse)
//        
//        let result = api.postMethodCall(controllerName: "User", actionName: "AddCourse", httpBody: data)
//        if result.ResponseCode != 200
//        {
//            print("failed to add Course!:\(result.ResponseMessage)")
//        }else{
//            print("Added")
//        }
//    }
//
//
//var imagepicker = UIImagePickerController()
//
//func imagePickerControllerDidCancle(_ picker: UIImagePickerController){
//    
//    let col = Course()
//    let data = col.Cimage
//    //        let base64 = database64EncodedString(option: .lineLength64Characters)
//    //     let result = api.UploadImageMethodCall(cJson: data!, endpoints: "fileUploading/UploadFile")
//    //       )
//    //
//}
//
//func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
//    imgcover.image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
//    imgcover.image = imgcover.image?.scaledImage(withSize: CGSize(width: 120, height: 120))
//    
////  let data = imgcover.image?.pngData()
////    let api = APIWrapper()
////   let result =  api.UploadImageMethodCall(cJson: data!, endPoint: "User/UploadImage")
////    print(result)
////            if let selectedimage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
////            {
////                imgcover.image = selectedimage
////            }else{
////
////            }
//    dismiss(animated: true, completion: nil)
//}
//    
//    
//}
//
//extension UIImage {
//    
////    func scaledImage(withSize size: CGSize) -> UIImage {
////        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
////        defer { UIGraphicsEndImageContext() }
////        draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
////        return UIGraphicsGetImageFromCurrentImageContext()!
////    }
////
////
////    func scaleImageToFitSize(size: CGSize) -> UIImage {
////        let aspect = self.size.width / self.size.height
////        if size.width / aspect <= size.height {
////            return scaledImage(withSize: CGSize(width: size.width, height: size.width / aspect))
////        } else {
////            return scaledImage(withSize: CGSize(width: size.height * aspect, height: size.height))
////        }
////}
//    
//}
//
//
