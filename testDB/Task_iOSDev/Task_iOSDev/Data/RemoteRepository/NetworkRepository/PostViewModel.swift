//
//  PostViewModel.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import Foundation

class PostViewModel: BaseViewModel {
  
    func getAllPosts(completionHandler: @escaping ([PostsModel]) -> ()) {
        
        let result = mDataManager.AllPosts()
       
        completionHandler(result)
    }
 
}

