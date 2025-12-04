//
//  Model.swift
//  MyMusicStorage
//
//  Created by Артём on 30.11.2025.
//

import Foundation

struct Track: Identifiable, Codable, Hashable {
    let id: String
    let name: String
    let position: String
}

extension Track: Comparable {
    static func < (lhs: Track, rhs: Track) -> Bool {
        return Int(lhs.position)! < Int(rhs.position)!
    }
    
    
}
