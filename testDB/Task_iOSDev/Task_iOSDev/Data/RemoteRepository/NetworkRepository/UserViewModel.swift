//
//  UserModel.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import Foundation

class UserViewModel: BaseViewModel {

    func loginUSer(email:String, Password: String, completionHandler: @escaping (Bool) -> ()) -> UserModel {
       
        let result = mDataManager.loginUSer(email: email, Password: Password) { status in
            if status == false {
                // error
                completionHandler(false)
                
            } else {
                // true
                completionHandler(true)
            }
            
        }
       
        return result
        
    }
 
}
