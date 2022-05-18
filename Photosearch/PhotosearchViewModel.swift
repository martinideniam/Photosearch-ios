//
//  PhotosearchViewModel.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 18.05.2022.
//

import Foundation

class PhotosearchViewModel: ObservableObject {
    
    typealias Photo = PhotosearchModel.Photo
    
    @Published var model = PhotosearchModel()
    
    var randomPhotos: Array<Photo> {
        model.randomPhotos
    }
    
    var favoritePhotos: Array<Photo> {
        model.favoritePhotos
    }
    
    var selectedPhoto: Photo {
        model.selectedPhoto
    }
    
    func addPhotoToRandomPhotos(id: String, created_at: String, url: String, downloads: Int, username: String, location: String?) {
        model.addPhotoToRandomPhotos(id: id, created_at: created_at, url: url, downloads: downloads, username: username, location: location)
    }
    
    func addPhotoToFavoritePhotos(id: String, created_at: String, url: String, downloads: Int, username: String, location: String?) {
        model.addPhotoToFavoritePhotos(id: id, created_at: created_at, url: url, downloads: downloads, username: username, location: location)
    }
    
    func selectPhoto(photo: Photo) {
        model.selectPhoto(photo: photo)
    }
    
    func generateRandomPictures() {
        if let pictures = parseLocalFile(forName: "data") {
            for picture in pictures {
                let id = picture.id
                let created_at = picture.created_at
                let url = picture.urls.small
                let downloads = picture.downloads
                let username = picture.user.username
                let location = picture.location
                addPhotoToRandomPhotos(id: id, created_at: created_at, url: url, downloads: downloads, username: username, location: location)
            }
        }
    }
    
    init() {
        generateRandomPictures()
        print(randomPhotos)
    }
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func parseLocalFile(forName name: String) -> [Picture]? {
        if let data = readLocalFile(forName: name) {
            if let decodedResponse = try? JSONDecoder().decode([Picture].self, from: data) {
                print(decodedResponse)
                return decodedResponse
            }
        }
        return nil
    }
    
}
