//
//  CoursesTableViewCell.swift
//  iOSTutorials
//
//  Created by Sadia on 04/10/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet weak var btndelete: UIButton!
    @IBOutlet weak var imgCimage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var book: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
