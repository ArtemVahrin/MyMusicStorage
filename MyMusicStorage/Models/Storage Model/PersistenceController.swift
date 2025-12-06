//
//  PersistantContainer.swift
//  MyMusicStorage
//
//  Created by Артём on 06.12.2025.
//

import Foundation
import SwiftData

class PersistenceController {
    static let shared = PersistenceController()
    
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(
                for: FavoriteAlbum.self,
                configurations: ModelConfiguration(isStoredInMemoryOnly: false)
            )
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
}
