//
//  AlbumModel.swift
//  MyMusicStorage
//
//  Created by Артём on 03.12.2025.
//

import Foundation

struct Album: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let artistName: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image
        case artistName = "artist_name"
        
    }
}
