//
//  ProjectConstants.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import Foundation

class ProjectConstants {
    static let current = ProjectConstants()
    
    func getPostsURL () -> String {
        return "https://jsonplaceholder.typicode.com/posts"
        
    }
    
    func loginURL() -> String{
        return "https://example.com/post"
    }
    
}
