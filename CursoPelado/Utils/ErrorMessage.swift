//
//  ErrorMessage.swift
//  CursoPelado
//
//  Created by Agustin Carbajal on 05/01/2025.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request"
    case unableToTcomplete  = "Unabled to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server"
    case invalidData        = "The data receive from the server is invalid"
    case unabledToFavorite  = "Thre was an error favoriting this user. Please try again"
    case alreadyInFavorites = "You have already favorited this user"
}
