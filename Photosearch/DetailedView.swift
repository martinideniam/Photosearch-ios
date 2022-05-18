//
//  DetailedView.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 17.05.2022.
//

import SwiftUI

struct DetailedView: View {
    @ObservedObject var viewModel: PhotosearchViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                pictureView
                pictureInfoView
                actionView
                    .padding()
                Spacer()
            }
            .navigationTitle("Selected picture")
            .navigationBarTitleDisplayMode(.inline)
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
                Text("Date created: \(viewModel.selectedPhoto.created_at)")
                Text("Place: \(viewModel.selectedPhoto.location)")
                Text("Times donwloaded: \(viewModel.selectedPhoto.downloads)")
            }
            .font(.headline)
            .padding()
            Spacer()
        }
    }
    var actionView: some View {
        HStack {
            Button {
                //
            } label: {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
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
