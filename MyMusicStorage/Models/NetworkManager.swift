//
//  NetworkManager.swift
//  MyMusicStorage
//
//  Created by Артём on 30.11.2025.
//

import Foundation

struct JamendoResponse: Codable {
    let headers: ResponseHeaders
    let results: [Track]
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
        try await dataFetcher.fetchTracks(parameters: [
            "order": "popularity_total",
            "limit": "\(limit)"
        ])
    }
}

enum APIError: Error {
    case invalidURL
    case serverError(String)
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
    
    fileprivate func fetchTracks(parameters: [String: String]) async throws-> [Track] {
        var params = parameters
        params["client_id"] = clientId
        params["format"] = "json"
        
        let url = try URLBuilder(baseURL: baseURL).buildURL(endpoint: "/tracks/", parameters: params)
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(JamendoResponse.self, from: data)
        
        guard response.headers.code == 0 else {
            throw APIError.serverError(response.headers.errorMessage ?? "Unknown Error")
        }
        
        return response.results
    }
}
