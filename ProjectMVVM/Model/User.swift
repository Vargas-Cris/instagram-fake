//
//  User.swift
//  ProjectMVVM
//
//  Created by MAC12 on 7/05/22.
//

import Foundation
struct Users : Codable{
    let data2:[User]
   
    
}

struct User : Codable{
    let id: String
    let title:String
    let firstName:String
    let lastName:String
    let picture:String
    let gender:String
    let email:String
    let dateOfBirth:String
    let phone:String
}
