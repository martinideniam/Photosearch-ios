//
//  Pictures.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 18.05.2022.
//

import Foundation



struct Picture: Decodable {
    var id: String
    var created_at: String
    var urls: SomeURL
    var downloads: Int
    var user: User
    var location: Location
}

struct SomeURL: Decodable {
    var small: String
    var small_s3: String
}

struct User: Decodable {
    var username: String
}

struct Location: Decodable {
    var title: String?
}
