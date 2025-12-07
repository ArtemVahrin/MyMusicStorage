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
    @State var searchFromApiText: String = ""
    init() {
        let service = JamendoService(clientId: "a4fa908b", baseURL: "https://api.jamendo.com/v3.0")
        let repository = FavoriteRepository(modelContext: PersistenceController.shared.container.mainContext)
        _viewModel = StateObject(wrappedValue: MusicViewModel(jamendoService: service, favoritesRepository: repository))
    }
    var body: some View {
        
        TabView {
            Tab("Popular", systemImage: "music.note") {
                NavigationStack {
                    AlbumsLibraryView(
                        albums: viewModel.albums,
                        onToggleFavorite: { album in
                            viewModel.toggleFavorite(album: album)
                        },
                        isFavoriteAlbum: { albumId in
                            viewModel.isFavoriteAlbum(albumId)
                        })
                    .animation(.default,value: viewModel.albums)
                    .navigationTitle("Popular Albums")
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink {
                                SearchView(albums: viewModel.searchedAlbums,                              onToggleFavorite: { album in
                                                viewModel.toggleFavorite(album: album)
                                            },
                                            isFavoriteAlbum: { albumId in
                                                viewModel.isFavoriteAlbum(albumId)
                                            },
                                            searchFromAPItext: $searchFromApiText,
                                            onCommit: performSearch)
                            } label: {
                                Image(systemName: "magnifyingglass")
                            }

                        }
                    }
                }
                
                // FIXME: need to create cusom searchBar
                .task {
                    await viewModel.loadPopularAlbums()
                }
            }
            
            Tab("Saved", systemImage: "heart") {
                NavigationStack {
                    SavedTrackListView(albums: viewModel.filteredFavoriteAlbums,
                                       onToggleFavorite: { album in
                        viewModel.toggleFavorite(album: album)
                    },
                                       isFavoriteAlbum: { albumId in
                        viewModel.isFavoriteAlbum(albumId)
                    })
                    .animation(.default,value: viewModel.filteredFavoriteAlbums)
                    .navigationTitle("Favorite albums")
                }
                .searchable(text: $viewModel.searchText)
                
            }
        }
        .padding()
    }
    
    func performSearch() {
        Task {
            await viewModel.searcAlbumsFromAPI(query: searchFromApiText)
        }
    }
}

#Preview {
    ContentView()
}

