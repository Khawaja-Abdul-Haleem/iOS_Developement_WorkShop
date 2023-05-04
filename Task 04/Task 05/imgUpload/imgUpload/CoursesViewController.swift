//
//  CoursesViewController.swift
//  iOSTutorials
//
//  Created by Sadia on 04/10/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cm = CourseManager()
    var myCourse: [Course] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        myCourse = cm.allCourses()
    }
    

    @IBAction func dltCourse(_ sender: UIButton)
    {
        let courseId = sender.tag
        if cm.deletecourse(cid: courseId)
        {
            myCourse = cm.allCourses()
            tableView.reloadData()
            
        }
        else
        {
        print(cm.Message)
        }
    }
    

}
extension CoursesViewController: UITableViewDataSource, UITableViewDelegate
{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return myCourse.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoursesTableViewCell
    let course = myCourse[indexPath.row]
          cell.author.text = course.author!
          cell.book.text = course.book!
    cell.btndelete.tag = course.cid!
          cell.price.text = "\(course.price!)"
         cell.imgCimage.image = Utilities.getImageFromURL(name:course.Cimage!)
          cell.title.text = course.title
    
    return cell
}
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
   
}
