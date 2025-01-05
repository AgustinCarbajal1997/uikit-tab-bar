//
//  User.swift
//  CursoPelado
//
//  Created by Agustin Carbajal on 05/01/2025.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
