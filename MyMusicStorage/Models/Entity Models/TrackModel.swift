//
//  Model.swift
//  MyMusicStorage
//
//  Created by Артём on 30.11.2025.
//

import Foundation

struct Track: Identifiable, Codable {
    let id: String
    let name: String
    let artistName: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image
        case artistName = "artist_name"
        
    }
}
