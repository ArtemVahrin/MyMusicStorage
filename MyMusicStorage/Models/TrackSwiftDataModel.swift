//
//  TrackSwiftDataModel.swift
//  MyMusicStorage
//
//  Created by Артём on 04.12.2025.
//

import Foundation
import SwiftData

@Model
final class TrackSwiftDataModel {
    var id: String
    var name: String
    var position: String
    
    init(id: String, name: String, position: String) {
        self.id = id
        self.name = name
        self.position = position
    }
}
