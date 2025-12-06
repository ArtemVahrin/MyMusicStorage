//
//  ContentView.swift
//  MyMusicStorage
//
//  Created by Артём on 30.11.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var viewModel: MusicViewModel
    
    init() {
        let service = JamendoService(clientId: "a4fa908b", baseURL: "https://api.jamendo.com/v3.0")
        let repository = FavoriteRepository(modelContext: PersistenceController.shared.container.mainContext)
        _viewModel = StateObject(wrappedValue: MusicViewModel(jamendoService: service, favoritesRepository: repository))
    }
    var body: some View {
        
        TabView {
            Tab("Popular Tracks", systemImage: "music.note") {
                NavigationStack {
                    AlbumsLibraryView(albums: viewModel.filteredAlbums, onToggleFavorite: { album in
                        viewModel.toggleFavorite(album: album)
                    })
                }
                // FIXME: need to create cusom searchBar
                .task {
                    await viewModel.loadPopularAlbums()
                    
                }
            }
            
            Tab("Saved Tracks", systemImage: "music.note") {
                SavedTrackListView(albums: viewModel.favoriteAlbums, onToggleFavorite: { album in
                    viewModel.toggleFavorite(album: album)
                })

            }
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}

