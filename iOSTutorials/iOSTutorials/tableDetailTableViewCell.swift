//
//  tableDetailTableViewCell.swift
//  iOSTutorials
//
//  Created by Sadia on 08/10/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import UIKit

class tableDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblBook: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
