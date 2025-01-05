//
//  Follower.swift
//  CursoPelado
//
//  Created by Agustin Carbajal on 05/01/2025.
//

import Foundation

struct Follower: Codable {
    var login: String
    var avatarUrl: String
    
    //init(from decoder: any Decoder) throws {
    //    let container = try decoder.container(keyedBy: CodingKeys.self)
    //    self.login = try container.decode(String.self, forKey: .login)
    //    self.avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
    //}
}
