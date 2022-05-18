//
//  FavoriteView.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 17.05.2022.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel: PhotosearchViewModel
    @State var navigate: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                picturesView
            }
            .navigationTitle("Favorite pictures")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var picturesView: some View {
        let threeColumnGrid = [
            GridItem(.flexible(minimum: 40), spacing: 0),
            GridItem(.flexible(minimum: 40), spacing: 0),
            GridItem(.flexible(minimum: 40), spacing: 0),
        ]
        return ScrollView {
            LazyVGrid(columns: threeColumnGrid, alignment: .leading, spacing: 0) {
                ForEach(viewModel.favoritePhotos, id: \.id) { photo in
                    NavigationLink(destination: DetailedView(viewModel: viewModel), isActive: $navigate) {
                        pictureView(photo: photo)
                            .padding(2)
                            .onTapGesture {
                                viewModel.selectPhoto(photo: photo)
                                withAnimation(Animation.easeInOut(duration: 2)) {
                                    navigate.toggle()
                                }
                    }
                    }
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhotosearchViewModel()
        FavoriteView(viewModel: viewModel)
    }
}
