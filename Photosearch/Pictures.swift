//
//  Pictures.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 18.05.2022.
//

import Foundation

struct Results: Decodable {
    var results: [Picture]
}

struct Picture: Decodable {
    var id: String
    var created_at: String
    var urls: SomeURL
    var user: User
}

struct SomeURL: Decodable {
    var small: String
    var small_s3: String
}

struct User: Decodable {
    var username: String
}

