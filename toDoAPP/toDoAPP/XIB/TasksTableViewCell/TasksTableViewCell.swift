//
//  TasksTableViewCell.swift
//  toDoAPP
//
//  Created by Khawaja Abdul Haleem on 18/05/2023.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var taskCheckBox: UIImageView!
    var taskSelected = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
