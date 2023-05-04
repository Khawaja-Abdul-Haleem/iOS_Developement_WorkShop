//
//  UserModel.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import Foundation

class UserModel: Codable {
    let email: String?
    let password: String?
   
    init(email: String, password: String) {
        self.email = email
        self.password = password
      
        
    }
    
    func toString() -> String {
        return "email \(String(describing: email?.description)) password \(String(describing: password?.description))"
        
    }
}

