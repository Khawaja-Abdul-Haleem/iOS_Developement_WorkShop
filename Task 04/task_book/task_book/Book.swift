//
//  Book.swift
//  task_book
//
//  Created by Khawaja Abdul Haleem on 14/10/2021.
//

import Foundation

class Book : Codable {
    var Id : Int = 0
    var Title : String? = ""
    var Author : String? = ""
    var Pubisher : String? = ""
    var CoverPicture : String? = ""
    var Price : String? = ""
}

class BookManager {
    var wrapper = APIWrapper()
    var decoder = JSONDecoder()
    var encoder = JSONEncoder()
    var Message = ""
    
    public func AllBooks()->[Book] {
        var books : [Book] = []
        let result = wrapper.getMethodCall(controllerName: "Books", actionName: "allbooks")
        if result.ResponseCode == 200 {
            //ok
            guard let data = result.ResponseData else {
                Message = result.ResponseMessage
                return books
            }
            
            //data is ok
            books = try! decoder.decode([Book].self, from: data)
            
        } else {
            Message = result.ResponseMessage
        }
        return books
    }
    
    public func AddBooks(book : Book) -> Bool {
        let data = try! encoder.encode(book)
        let result = wrapper.postMethodCall(controllerName: "Books", actionName: "AddBooks", httpBody: data)
        
        if result.ResponseCode == 200 {
            //ok
            return true
        } else {
            Message = result.ResponseMessage
            return false
        }
    }
    
    public func deleteBooks(bid : Int) -> Bool {
        
        let result = wrapper.getMethodCall(controllerName: "Books", actionName: "deleteBooks/\(bid)")
        
        if result.ResponseCode == 200 {
            //ok
            return true
        } else {
            Message = result.ResponseMessage
            return false
        }
    }
    
    public func ModifyBooks(book : Book) -> Bool {
        let data = try! encoder.encode(book)
        let result = wrapper.postMethodCall(controllerName: "Books", actionName: "ModifyBooks", httpBody: data)
        
        if result.ResponseCode == 200 {
            //ok
            return true
        } else {
            Message = result.ResponseMessage
            return false
        }
    }
}
