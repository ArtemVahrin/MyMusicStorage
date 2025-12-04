//
//  NetworkManager.swift
//  MyMusicStorage
//
//  Created by Артём on 30.11.2025.
//

import Foundation

class JamendoService {
    private var clientId: String
    private let baseURL: String
    private let dataFetcher: DataFetcher
    
    init(clientId: String, baseURL: String) {
        self.clientId = clientId
        self.baseURL = baseURL
        self.dataFetcher = DataFetcher(baseURL: baseURL, clientId: clientId)
    }
    
    func fetchPopularTracks(limit: Int = 20) async throws -> [Track] {
        let result: [Track] = try await dataFetcher.fetchData(dataType: .tracks("/tracks/"), parameters: [
            "order": "popularity_total",
            "limit": "\(limit)"
        ])
        return result
    }
    func fetchPopularAlbums(limit: Int = 20) async throws -> [Album] {
        let result: [Album] = try await dataFetcher.fetchData(dataType: .albums("/albums/tracks"), parameters: [
            "order": "popularity_week",
            "limit": "\(limit)",
            "type": "album"
        ])
        print(result)
        return result
    }
}

enum Endpoint {
    case tracks(String)
    case albums(String)
}

