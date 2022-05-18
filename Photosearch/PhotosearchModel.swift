//
//  PhotosearchModel.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 18.05.2022.
//

import Foundation

struct PhotosearchModel {
    private(set) var randomPhotos: Array<Photo> = []
    private(set) var selectedPhoto = Photo(id: "",
                                           created_at: "",
                                           url: "",
                                           username: "")
    struct Photo {
        var id: String
        var created_at: String
        var url: String
        var username: String
        var favorite: Bool = false
        
        init(id: String, created_at: String, url: String, username: String) {
            self.id = id
            self.created_at = created_at
            self.url = url
            self.username = username
        }
    }
    
    private func generatePhoto(id: String, created_at: String, url: String, username: String) -> Photo {
        return Photo(id: id, created_at: created_at, url: url, username: username)
    }
    
    func checkIfFavorite(photo: Photo) -> Bool {
        photo.favorite
    }
    
    mutating func treatFavoritePictures(photo: Photo) {
        if checkIfFavorite(photo: photo) {
            removePhotoFromFavoritePhotos(photo: photo)
        } else {
            addPhotoToFavoritePhotos(photo: photo)
        }
    }
    
    mutating func selectPhoto(photo: Photo) {
        selectedPhoto = photo
    }
    
    mutating func addPhotoToRandomPhotos(id: String, created_at: String, url: String, username: String) {
        randomPhotos.append(generatePhoto(id: id, created_at: created_at, url: url, username: username))
    }
    
    mutating func removeAllRandomPhotos() {
        randomPhotos = []
    }
    
    mutating func addPhotoToFavoritePhotos(photo: Photo) {
        if let index = randomPhotos.firstIndex(where: {$0.id == photo.id}) {
            randomPhotos[index].favorite = true
        }
    }
    
    mutating func removePhotoFromFavoritePhotos(photo: Photo) {
        if let index = randomPhotos.firstIndex(where: {$0.id == photo.id}) {
            randomPhotos[index].favorite = false
        }
    }
}
