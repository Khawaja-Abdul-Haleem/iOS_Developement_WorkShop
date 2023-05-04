//
//  DataManager.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 25/10/2022.
//

import Foundation

class DataManager {
    var apiWrapper = ApiWrapper()
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()
    var Message = ""

    public func AllPosts()->[PostsModel] {
        var posts : [PostsModel] = []
        let result = apiWrapper.getMethodCall(actionName: Constants.postURL)
        if result.ResponseCode == 200 {
            //ok
            guard let data = result.ResponseData else {
                Message = result.ResponseMessage
                
                return posts
            }
            
            //data is ok
            posts = try! decoder.decode([PostsModel].self, from: data)
      
            
        } else {
            Message = result.ResponseMessage
        }
        return posts
    }
   
    public func loginUSer(email:String, Password: String, completionHandler: @escaping (Bool) -> ()) -> UserModel {
     
        var users = UserModel(email: email, password: Password)
       
        let data = try! encoder.encode(users)
        
        let result = apiWrapper.postMethodCall(actionName: Constants.loginURL, httpBody: data)
        
        if result.ResponseCode == 200 {
            //ok
            users = try! decoder.decode(UserModel.self, from: result.ResponseData!)
            completionHandler(true)
            
        } else {
            Message = result.ResponseMessage
            completionHandler(false)
        }
       
        return users
        
    }
    
    
}
