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
        VStack {
            TrackListView(tracks: viewModel.tracks)
        }
        .task {
            await viewModel.loadPopularTracks()
        }
        .padding()
    }
}

struct TrackListView: View {
    var tracks = [Track]()
    
    var body: some View {
        ScrollView() {
            ForEach(tracks) { track in
                VStack {
                    Text(track.artistName)
                    Text(track.name)
                    Text("\(track.id)")
                    AsyncImage(url: URL(string: track.image))
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

