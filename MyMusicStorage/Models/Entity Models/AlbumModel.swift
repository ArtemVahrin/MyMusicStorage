//
//  AlbumModel.swift
//  MyMusicStorage
//
//  Created by Артём on 03.12.2025.
//

import Foundation

struct Album: Identifiable, Codable, Hashable {
    static func == (lhs: Album, rhs: Album) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    let id: String
    let name: String
    let artistName: String
    let image: String
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, tracks
        case artistName = "artist_name"
        
    }
}
