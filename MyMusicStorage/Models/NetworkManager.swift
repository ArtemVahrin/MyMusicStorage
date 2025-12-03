//
//  NetworkManager.swift
//  MyMusicStorage
//
//  Created by Артём on 30.11.2025.
//

import Foundation

struct JamendoResponse<T: Codable>: Codable {
    let headers: ResponseHeaders
    let results: [T]
}

struct ResponseHeaders: Codable {
    let code: Int
    let errorMessage: String?
}

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
        print(result)
        return result
    }
    func fetchPopularAlbums(limit: Int = 20) async throws -> [Album] {
        let result: [Album] = try await dataFetcher.fetchData(dataType: .albums("/albums/"), parameters: [
            "order": "popularity_total",
            "limit": "\(limit)"
        ])
        print(result)
        return result
    }
}

enum APIError: Error {
    case invalidURL
    case serverError(String)
}

enum Endpoint {
    case tracks(String)
    case albums(String)
}
struct URLBuilder {
    let baseURL: String
    
    fileprivate func buildURL(endpoint: String, parameters: [String: String]) throws -> URL {
        var components = URLComponents(string: baseURL + endpoint)
        components?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = components?.url else {
            throw APIError.invalidURL
        }
        
        return url
    }
}

struct DataFetcher {
    let baseURL: String
    let clientId: String
    
    fileprivate func fetchData<T: Codable>(dataType: Endpoint,parameters: [String: String]) async throws-> [T] {
        var params = parameters
        params["client_id"] = clientId
        params["format"] = "json"
        
        let endpoint: Endpoint = dataType
        var stringEndpoint: String
        
        switch endpoint {
        case .albums(let albumEndpoint):
            stringEndpoint = albumEndpoint
        case .tracks(let tracksEndpoint):
            stringEndpoint = tracksEndpoint
        }
        
        let url = try URLBuilder(baseURL: baseURL).buildURL(endpoint: stringEndpoint, parameters: params)
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(JamendoResponse<T>.self, from: data)
        
        guard response.headers.code == 0 else {
            throw APIError.serverError(response.headers.errorMessage ?? "Unknown Error")
        }
        
        return response.results
    }
}
