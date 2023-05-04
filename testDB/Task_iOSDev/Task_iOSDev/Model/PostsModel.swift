//
//  PostsViewModel.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import Foundation

class PostsModel: Codable {
    
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id, title, body
    }
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        
    }
    
    func toString() -> String {
        return "userId \(String(describing: userId?.description)) id \(String(describing: id?.description)) title \(String(describing: title?.description)) body \(String(describing: body?.description))"
        
    }

}
