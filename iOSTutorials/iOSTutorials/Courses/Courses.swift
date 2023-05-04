//
//  Courses.swift
//  iOSTutorials
//
//  Created by Sadia on 04/10/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import Foundation
class Course: Codable
{
    var cid: Int? = 0
    var title: String? = ""
    var book: String? = ""
    var price: Int? = 0
    var author: String? = ""
    var Cimage: String? = ""
}
class CourseManager
{
    var apiwrapper = APIWrapper()
    var decoder = JSONDecoder()
    var encoder = JSONEncoder()
    var Message = ""
    public func allCourses()->[Course]
    {
        var courses: [Course] = []
        let result = apiwrapper.getMethodCall(controllerName: "User", actionName: "allCourses")
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData else{
                Message = result.ResponseMessage
                return courses
            }
            courses = try! decoder.decode([Course].self, from: data)
        }
        else
        {
            Message = result.ResponseMessage
        }
        return courses
    }
    public func deletecourse(cid: Int)-> Bool
    {
      //  let result = apiwrapper.getMethodCall(controllerName: "User", actionName: "deleteCourse?cid="+String(cid))
        
        let result = apiwrapper.getMethodCall(controllerName: "User", actionName: "deleteCourse?cid=\(cid)")
        
        if result.ResponseCode == 200
        {
        return true
        }
        else
        {
        Message = result.ResponseMessage
        return false
        }
        
    }
    
}
