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
        return model.randomPhotos.filter { photo in
            photo.favorite == true
        }
    }
    
    var selectedPhoto: Photo {
        model.selectedPhoto
    }
    
    func addPhotoToRandomPhotos(id: String, created_at: String, url: String, username: String) {
        model.addPhotoToRandomPhotos(id: id, created_at: created_at, url: url, username: username)
    }
    
    func addPhotoToFavoritePhotos(photo: Photo) {
        model.addPhotoToFavoritePhotos(photo: photo)
    }
    
    func removePhotoFromFavoritePhotos(photo: Photo) {
        model.removePhotoFromFavoritePhotos(photo: photo)
    }
    
    func removeAllPhotos() {
        model.removeAllRandomPhotos()
    }
    
    func selectPhoto(photo: Photo) {
        model.selectPhoto(photo: photo)
    }
    
    func loadData(searchQuery: String) async {
        let key = ""
        let url = "https://api.unsplash.com/search/photos?page=1&query=\(searchQuery)&client_id=\(key)&per_page=20"
        guard let url = URL(string: url) else {
            print("invalid url")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Results.self, from: data) {
                for picture in decodedResponse.results {
                    let id = picture.id
                    let created_at = picture.created_at
                    let url = picture.urls.small
                    let username = picture.user.username
                    addPhotoToRandomPhotos(id: id, created_at: created_at, url: url, username: username)
                }
            }
        } catch {
            print("invalid data")
        }
    }
    
}
