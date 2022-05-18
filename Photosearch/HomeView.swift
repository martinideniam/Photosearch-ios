//
//  HomeView.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 17.05.2022.
//

import SwiftUI

struct HomeView: View {
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
                ForEach(1..<100) { _ in
                    NavigationLink {
                        Text("hello")
                    } label: {
                        NavigationLink(destination: DetailedView()) {
                            pictureView
                        }
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
