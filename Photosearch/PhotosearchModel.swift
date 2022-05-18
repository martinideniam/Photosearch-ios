//
//  PhotosearchModel.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 18.05.2022.
//

import Foundation

struct PhotosearchModel {
    private(set) var randomPhotos: Array<Photo> = []
    private(set) var favoritePhotos: Array<Photo> = []
    private(set) var selectedPhoto = Photo(id: "",
                                           created_at: "",
                                           url: "",
                                           downloads: 1,
                                           username: "",
                                           location: "")
    struct Photo {
        var id: String
        var created_at: String
        var url: String
        var downloads: Int
        var username: String
        var location: String
        
        init(id: String, created_at: String, url: String, downloads: Int, username: String, location: String?) {
            self.id = id
            self.created_at = created_at
            self.url = url
            self.downloads = downloads
            self.username = username
            self.location = location ?? ""
        }
    }
    
    private func generatePhoto(id: String, created_at: String, url: String, downloads: Int, username: String, location: String?) -> Photo {
        return Photo(id: id, created_at: created_at, url: url, downloads: downloads, username: username, location: location)
    }
    
    mutating func selectPhoto(photo: Photo) {
        selectedPhoto = photo
    }
    
    mutating func addPhotoToRandomPhotos(id: String, created_at: String, url: String, downloads: Int, username: String, location: String?) {
        randomPhotos.append(generatePhoto(id: id, created_at: created_at, url: url, downloads: downloads, username: username, location: location))
    }
    
    mutating func addPhotoToFavoritePhotos(id: String, created_at: String, url: String, downloads: Int, username: String, location: String?) {
        favoritePhotos.append(generatePhoto(id: id, created_at: created_at, url: url, downloads: downloads, username: username, location: location))
    }
}
