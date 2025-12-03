//
//  ContentView.swift
//  MyMusicStorage
//
//  Created by Артём on 30.11.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: MusicViewModel

    init() {
        let service = JamendoService(clientId: "a4fa908b", baseURL: "https://api.jamendo.com/v3.0")
        _viewModel = StateObject(wrappedValue: MusicViewModel(jamendoService: service))
        
    }
    var body: some View {
        NavigationStack {
            VStack {                
//                TrackListView(tracks: viewModel.filteredTracks)
                AlbumsLibraryView(albums: viewModel.albums)
            }
            .searchable(text: $viewModel.searchText ,placement: .navigationBarDrawer)
            .navigationTitle("My Library")
        }
        .task {
            await viewModel.loadPopularTracks()
        }
        .task {
            await viewModel.loadPopularAlbums()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

