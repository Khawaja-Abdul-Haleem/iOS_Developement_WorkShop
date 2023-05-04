//
//  BookDetailCell.swift
//  task_book
//
//  Created by Khawaja Abdul Haleem on 14/10/2021.
//

import UIKit

class BookDetailCell: UITableViewCell {

    
    @IBOutlet weak var coverPicture: UIImageView!
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var publisherName: UILabel!
    
    @IBOutlet weak var bookPrice: UILabel!
   
    
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var btnEdit: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
