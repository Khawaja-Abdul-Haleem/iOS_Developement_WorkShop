//
//  tableDetailViewController.swift
//  iOSTutorials
//
//  Created by Sadia on 08/10/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import UIKit

class tableDetailViewController: UIViewController {
    var cm = Course1Manager()
    var mycourses:[Course1] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       mycourses  = cm.allCourses()
      
    }
    
}


extension tableDetailViewController: UITableViewDelegate, UITableViewDataSource
{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return mycourses.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableDetailTableViewCell
    let course = mycourses[indexPath.row]
    cell.lblAuthor.text = course.author
    cell.lblBook.text = course.book
    cell.lblPrice.text = "\(course.price!)"
    cell.lblTitle.text = course.title
    return cell
    
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 208
    }
}

