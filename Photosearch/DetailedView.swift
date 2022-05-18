//
//  DetailedView.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 17.05.2022.
//

import SwiftUI

struct DetailedView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                pictureView
                    .frame(width: .infinity)
                pictureInfoView
                actionView
                    .padding()
                Spacer()
            }
            .navigationTitle("Name of the picture")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    var pictureView: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("image")
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .border(Color.white)
            Text("Author: Vladislav Gorovenko")
                .padding(4)
                .background(.black)
                .foregroundColor(.white)
                .font(.caption)
                .offset(x: -5, y: -5)
        }
    }
    var pictureInfoView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Date created: 04.04.1994")
                Text("Place: Azov")
                Text("Times donwloaded: 2405000")
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
        DetailedView()
    }
}
