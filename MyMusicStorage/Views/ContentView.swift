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
            AlbumsLibraryView(albums: viewModel.filteredAlbums)
                .navigationTitle("My Library")
        }
        .searchable(text: $viewModel.searchText ,placement: .navigationBarDrawer)
        .task {
            await viewModel.loadPopularTracks()
            await viewModel.loadPopularAlbums()
        }

        .padding()
    }
}

#Preview {
    ContentView()
}

