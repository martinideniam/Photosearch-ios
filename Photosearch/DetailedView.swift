//
//  DetailedView.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 17.05.2022.
//

import SwiftUI

struct DetailedView: View {
    @ObservedObject var viewModel: PhotosearchViewModel
    @State var favorite = false
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    pictureView
                }
                pictureInfoView
                actionView
                    .padding()
                Spacer()
            }
            .navigationTitle("Picture's ID: \(viewModel.selectedPhoto.id)")
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            favorite = viewModel.selectedPhoto.favorite
        }
    }
    var pictureView: some View {
        ZStack(alignment: .bottomTrailing) {
            imageView
            Text("Author: \(viewModel.selectedPhoto.username)")
                .padding(4)
                .background(.black)
                .foregroundColor(.white)
                .font(.caption)
                .offset(x: -5, y: -5)
        }
    }
    
    var imageView: some View {
        let urlString = viewModel.selectedPhoto.url
        return Group {
            AsyncImage(url: URL(string: urlString)) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
        }
    }
    
    var pictureInfoView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Created: \(viewModel.selectedPhoto.created_at)")
            }
            .font(.headline)
            .padding()
            Spacer()
        }
    }
    var actionView: some View {
        HStack {
            Button {
                if !favorite {
                    viewModel.addPhotoToFavoritePhotos(photo: viewModel.selectedPhoto)
                } else {
                    viewModel.removePhotoFromFavoritePhotos(photo: viewModel.selectedPhoto)
                }
                favorite = !favorite
                
            } label: {
                Text(favorite ? "Remove from favorite" : "Add to favorite")
            }
            .font(.largeTitle)
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhotosearchViewModel()
        DetailedView(viewModel: viewModel)
    }
}
