//
//  Posts.swift
//  ProjectMVVM
//
//  Created by MAC12 on 7/05/22.
//

import Foundation

struct Posts: Codable {
    let data: [Post]
    
    
}

struct Post: Codable {
    let id: String
    let image: String
    let tags: [String]
    let likes: Int
    let text: String
    let owner: Owner
}

struct Owner: Codable {
    let id: String
    let title: String
    let firstName: String
    let lastName: String
    let picture: String
    
}
