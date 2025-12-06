//
//  AlbumSwiftDataModel.swift
//  MyMusicStorage
//
//  Created by Артём on 05.12.2025.
//

import Foundation
import SwiftData

@Model
final class FavoriteAlbum: Identifiable, Hashable {
    static func == (lhs: FavoriteAlbum, rhs: FavoriteAlbum) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    var id: String
    var name: String
    var artistName: String
    var image: String
    var tracks: [Track]
    
    init(id: String, name: String, artistName: String, image: String, tracks: [Track]) {
        self.id = id
        self.name = name
        self.artistName = artistName
        self.image = image
        self.tracks = tracks
    }
    
    convenience init(album: Album) {
        let id = album.id
        let name = album.name
        let artistName = album.artistName
        let image = album.image
        let tracks = album.tracks /*as! [TrackSwiftDataModel]*/
        
        self.init(id: id, name: name, artistName: artistName, image: image, tracks: tracks)
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, tracks
        case artistName = "artist_name"
        
    }
}

extension FavoriteAlbum {
    func toAlbum() -> Album {
        return Album(id: self.id, name: self.name, artistName: self.artistName, image: self.image, tracks: self.tracks)
    }
}
