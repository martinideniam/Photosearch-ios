//
//  ContentView.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 17.05.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: PhotosearchViewModel
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                    }
                }
            FavoriteView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "heart.fill")
                        .padding()
                }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PhotosearchViewModel()
        ContentView(viewModel: viewModel)
    }
}
