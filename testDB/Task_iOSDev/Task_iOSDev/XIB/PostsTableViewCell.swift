//
//  PostsTableViewCell.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitle: UILabel!
    
    @IBOutlet weak var postDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurPostsCell(postsModel: PostsModel) {
        self.postTitle.text = postsModel.title!
        self.postDescription.text = postTitle.text!
     
        
    }
}
