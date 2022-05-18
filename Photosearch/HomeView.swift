//
//  HomeView.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 17.05.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: PhotosearchViewModel
    @State var navigate: Bool = false
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                searchBar
                    .padding()
                Spacer()
                picturesView
            }
            .navigationBarHidden(true)
        }
    }
    
    var searchBar: some View {
        HStack {
            TextField("What are you looking for?", text: $text)
            Image(systemName: "magnifyingglass")
        }
        .padding()
        .overlay(alignment: .center) {
            RoundedRectangle(cornerRadius: 5)
                .stroke()
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
                ForEach(viewModel.randomPhotos, id: \.id) { photo in
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

struct pictureView: View {
    var photo: PhotosearchModel.Photo
    var body: some View {
        Group {
            AsyncImage(url: URL(string: photo.url)) { image in
                image
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhotosearchViewModel()
        HomeView(viewModel: viewModel)
    }
}
