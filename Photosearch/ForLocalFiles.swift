//
//  ForLocalFiles.swift
//  Photosearch
//
//  Created by Vladislav Gorovenko on 18.05.2022.
//

import Foundation

func readLocalFile(forName name: String) -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: name,
                                             ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    
    return nil
}

func parseLocalFile(forName name: String) -> [Picture]? {
    if let data = readLocalFile(forName: name) {
        if let decodedResponse = try? JSONDecoder().decode(Results.self, from: data) {
            print(decodedResponse)
            return decodedResponse.results
        }
    }
    return nil
}
