//
//  TrackSwiftDataModel.swift
//  MyMusicStorage
//
//  Created by Артём on 04.12.2025.
//

import Foundation
import SwiftData

@Model
final class FavoriteTrack {
    var id: String
    var name: String
    var duration: String
    var addedDate: Date
    
    init(id: String, name: String, duration: String) {
        self.id = id
        self.name = name
        self.duration = duration
        self.addedDate = Date()
    }
    
    convenience init(track: Track) {
        let id = track.id
        let name = track.name
        let duration = track.duration
        
        self.init(id: id, name: name, duration: duration)
    }
}

extension FavoriteTrack {
    func toTrack() -> Track {
        return Track(
            id: self.id,
            name: self.name,
            position: "",
            duration: self.duration
        )
    }
}
