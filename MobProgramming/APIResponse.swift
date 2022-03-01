//
//  APIResponse.swift
//  MobProgramming
//
//  Created by Oleg Langer on 01.03.22.
//

import Foundation

func fetchUsers(completion: @escaping(ApiResponse) -> Void) {
    URLSession.shared.dataTask(with: URL(string: "https://reqres.in/api/users")!) { (data, response, error) in
        let decoder = JSONDecoder()
        completion(try! decoder.decode(ApiResponse.self, from: data!))
  }.resume()
}

struct ApiResponse : Codable {
    let data : [User]
}

struct User : Codable {
    let id : Int
    let email : String
    let first_name : String
    let last_name : String
    let avatar : String
}
