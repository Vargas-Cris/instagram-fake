//
//  PostsViewModel.swift
//  ProjectMVVM
//
//
//

import Foundation
import UIKit


class PostsViewModel{
    
    var posts = [Post]()
    var users = [User]()
    var user : User? = nil
    let URL_API = "https://dummyapi.io/data/v1/post?limit=30"
    let URL_API2 = "https://dummyapi.io/data/v1/user/60d0fe4f5311236168a10a0f"
    let appId = "626c31c5df0af1efad6b2d4c"
    
    func getDataFromAPI() async {
        do {
            // creamos nuestra url con su header
            var request = URLRequest(url: HelperString.getURLFromString(url: URL_API)!)
            request.httpMethod = "GET"
            request.addValue(appId, forHTTPHeaderField: "app-id")
            
            // cuando URLRequest siempre data(for: URLRequest)
            // cuando usamo URL siempre data(from: URL)
            let (data, _) = try await URLSession.shared.data(for: request)
            
            if let decoder = try? JSONDecoder().decode(Posts.self, from: data) {
                DispatchQueue.main.async(execute: {
                    // vamos a recorrer el array data y guardar los posts en el arrar posts
                    decoder.data.forEach { post in
                        self.posts.append(post)
                    }
                })
            }
        } catch {
            print("error")
        }
        
    }
    
    func getUser() async {
        do {
            // creamos nuestra url con su header
            var request = URLRequest(url: HelperString.getUrlFromUser(url2: URL_API2)!)
            request.httpMethod = "GET"
            request.addValue(appId, forHTTPHeaderField: "app-id")
            
            // cuando URLRequest siempre data(for: URLRequest)
            // cuando usamo URL siempre data(from: URL)
            let (data2, _) = try await URLSession.shared.data(for:request)
            
            if let decoder = try? JSONDecoder().decode(User.self, from: data2) {
                DispatchQueue.main.async(execute: {
                    // vamos a recorrer el array data y guardar los posts en el arrar user
                    self.user = decoder
                })
            }
        } catch {
            print("error")
        }
    }
}
