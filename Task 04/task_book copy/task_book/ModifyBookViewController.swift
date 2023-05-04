//
//  ModifyBookViewController.swift
//  task_book
//
//  Created by Khawaja Abdul Haleem on 15/10/2021.
//

import UIKit

class ModifyBookViewController: UIViewController {

    var book = Book()
    
    @IBOutlet weak var imgCover: UIImageView!
    
    @IBOutlet weak var titleLabel: UITextField!
    
    @IBOutlet weak var authorLabel: UITextField!
    
    @IBOutlet weak var publisherLabel: UITextField!
    
    @IBOutlet weak var priceLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = book.Title!
        authorLabel.text = book.Author!
        publisherLabel.text = book.Pubisher
        priceLabel.text = book.Price
        imgCover.image = Utilities.getImageFromURL(name: book.CoverPicture!)
        
    }
    

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        book.Title = titleLabel.text!
        book.Author = authorLabel.text!
        book.Pubisher = publisherLabel.text!
        book.Price = priceLabel.text!
        book.CoverPicture = "000.jpg"
        
        let manager = BookManager()
        let ans = manager.ModifyBooks(book: book)
        if ans == true {
            navigationController?.popViewController(animated: true)
        } else {
            print(manager.Message)
        }
    }
    
    

}
