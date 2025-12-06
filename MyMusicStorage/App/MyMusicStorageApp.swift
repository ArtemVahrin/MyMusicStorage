//
//  MyMusicStorageApp.swift
//  MyMusicStorage
//
//  Created by Артём on 30.11.2025.
//

import SwiftUI
import SwiftData
@main
struct MyMusicStorageApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: FavoriteAlbum.self)
        }
    }
}
