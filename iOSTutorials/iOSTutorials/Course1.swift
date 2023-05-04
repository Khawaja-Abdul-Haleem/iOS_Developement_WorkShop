//
//  Course1.swift
//  iOSTutorials
//
//  Created by Sadia on 08/10/2021.
//  Copyright © 2021 Sadia. All rights reserved.
//

import Foundation

class Course1: Codable
{
    var cid: Int? = 0
    var title: String? = ""
    var book: String? = ""
    var price: Int? = 0
    var author: String? = ""
    var Cimage: String? = ""
    
}

class Course1Manager
{
    var apiwrapper = APIWrapper()
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()
    var Message = ""
    
    public func allCourses()->[Course1]
    {
        var courses = [Course1]()
        let result = apiwrapper.getMethodCall(controllerName: "User", actionName: "allCourses")
        if result.ResponseCode == 200
        {
            guard let data = result.ResponseData else{
                Message = result.ResponseMessage
                return courses
            }
            courses = try! decoder.decode([Course1].self, from: data)
        }
        else
        {
            Message = result.ResponseMessage
        }
        return courses
    }
    
}
