//
//  PhotosearchApp.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 17.05.2022.
//

import SwiftUI

@main
struct PhotosearchApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = PhotosearchViewModel()
            ContentView(viewModel: viewModel)
        }
    }
}
