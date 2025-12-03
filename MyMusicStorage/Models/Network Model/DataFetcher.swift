//
//  DataFetcher.swift
//  MyMusicStorage
//
//  Created by Артём on 03.12.2025.
//

import Foundation

struct DataFetcher {
    let baseURL: String
    let clientId: String
    
    func fetchData<T: Codable>(dataType: Endpoint,parameters: [String: String]) async throws-> [T] {
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
