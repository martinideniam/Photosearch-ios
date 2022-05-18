//
//  FavoriteView.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 17.05.2022.
//

import SwiftUI

struct FavoriteView: View {
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
                ForEach(1..<100) { _ in
                    NavigationLink(destination: DetailedView()) {
                        pictureView
                    }
                }
            }
        }
    }
    
    var pictureView: some View {
        Image("image")
            .resizable()
            .aspectRatio(1, contentMode: .fill)
            .border(Color.white)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
