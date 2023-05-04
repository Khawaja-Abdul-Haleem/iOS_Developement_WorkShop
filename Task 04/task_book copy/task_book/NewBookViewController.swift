//
//  NewBookViewController.swift
//  task_book
//
//  Created by Khawaja Abdul Haleem on 14/10/2021.
//

import UIKit

class NewBookViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate  {

    
    @IBOutlet weak var imgCover: UIImageView!
    
    @IBOutlet weak var titleLabel: UITextField!
    
    @IBOutlet weak var authorLabel: UITextField!
    
    @IBOutlet weak var publisherLabel: UITextField!
    
    @IBOutlet weak var priceLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let book = Book()
        
        book.Title = titleLabel.text!
        book.Author = authorLabel.text!
        book.Pubisher = publisherLabel.text!
        book.Price = priceLabel.text!
        book.CoverPicture = "\(imgCover.image!)"
        //  book.CoverPicture = "000.jpg"
        
        let manager = BookManager()
      //  let ans = manager.AddBooks(book: book)
        
        let api = APIWrapper()
        let imgdata = imgCover.image?.pngData()

        let result1 = api.UploadImageMethodCall(cJson: imgdata!, endPoint: "books/UploadImage")
         var imgname = result1.ResponseMessage
        if result1.ResponseCode == 200 {
            imgname = String(data: result1.ResponseData!, encoding: .utf8)!
        }
        
      //  foodimg.image = "imgname"
      //  let encoder = JSONEncoder()
        
        book.CoverPicture = imgname
        
       let ans = manager.AddBooks(book: book)
       
//        let data = try! encoder.encode(book)
//
//        let result = api.postMethodCall(controllerName: "book", actionName: "addbook", httpBody: data)
//        if result.ResponseCode != 200
//        {
//            print("failed to add book!:\(result.ResponseMessage)")
//        }else{
//            print("book Added")
//        }
        
    //    navigationController?.popViewController(animated: true)

        if ans == true {
            navigationController?.popViewController(animated: true)
        } else {
            print(manager.Message)
        }
    }
    
    
    @IBAction func browseBtn(_ sender: UIButton) {
        let ac = UIAlertController(title: "Select Image", message: "Select Image from", preferredStyle: .actionSheet)
        
        let cameraBtn = UIAlertAction(title: "Camera", style: .default) {[weak self] (_) in
            print("Camera Press")
            self?.showImagePicker(selectedSource: .camera)
            //showImagePicker(selectedSource: .camera)
        }
        
        let galleryBtn = UIAlertAction(title: "Gallery", style: .default) {[weak self] (_) in
            print("Gallery Press")
            self?.showImagePicker(selectedSource: .photoLibrary)
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(cameraBtn)
        ac.addAction(galleryBtn)
        ac.addAction(cancelBtn)
        present(ac, animated: true, completion: nil)
        
//        let imgebrowse = UIImagePickerController()
//        imgebrowse.delegate = self
//
//        imgebrowse.sourceType = UIImagePickerController.SourceType.photoLibrary
//        imgebrowse.allowsEditing = false
//        self.present(imgebrowse, animated: true, completion: nil)
       
    }
    
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("Selected Source Not Avilable")
            return
        }
        
        let imgebrowse = UIImagePickerController()
        imgebrowse.delegate = self
        
        imgebrowse.sourceType = selectedSource
        imgebrowse.allowsEditing = false
        self.present(imgebrowse, animated: true, completion: nil)
    }
    
    var imagepicker = UIImagePickerController()

    func imagePickerControllerDidCancle(_ picker: UIImagePickerController){
        
        let book = Book()
        let data = book.CoverPicture
        //        let base64 = database64EncodedString(option: .lineLength64Characters)
        //     let result = api.UploadImageMethodCall(cJson: data!, endpoints: "fileUploading/UploadFile")
        //       )
        //
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        imgCover.image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
        imgCover.image = imgCover.image?.scaledImage(withSize: CGSize(width: 120, height: 120))
        
    
        dismiss(animated: true, completion: nil)
    }
    
}

extension UIImage {
    
//    func scaledImages() -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
//        defer { UIGraphicsEndImageContext() }
//        draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
//        return UIGraphicsGetImageFromCurrentImageContext()!
//    }
//
//    func scaleImageToFitSizes(size: CGSize) -> UIImage {
//        let aspect = self.size.width / self.size.height
//        if size.width / aspect <= size.height {
//            return scaledImage(withSize: CGSize(width: size.width, height: size.width / aspect))
//        } else {
//            return scaledImage(withSize: CGSize(width: size.height * aspect, height: size.height))
//        }
//    }
    func scaledImage(withSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
   
    
    func scaleImageToFitSize(size: CGSize) -> UIImage {
        let aspect = self.size.width / self.size.height
        if size.width / aspect <= size.height {
            return scaledImage(withSize: CGSize(width: size.width, height: size.width / aspect))
        } else {
            return scaledImage(withSize: CGSize(width: size.height * aspect, height: size.height))
        }
}
   
 
    
}
