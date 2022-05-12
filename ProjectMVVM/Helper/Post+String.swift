//
//  Post+String.swift
//  ProjectMVVM
//
//  Created by MAC12 on 5/05/22
//

import Foundation

class HelperString {
    
    static func getURLFromString(url: String) -> URL? {
        guard let url = URL(string: url) else { return nil }
        
        return url
    }
    
    static func getUrlFromUser(url2: String) -> URL? {
        guard let url2 = URL(string:url2) else { return nil}
        
        return url2
    }
}
