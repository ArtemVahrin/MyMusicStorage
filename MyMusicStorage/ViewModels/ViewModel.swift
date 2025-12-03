//
//  ViewModel.swift
//  MyMusicStorage
//
//  Created by Артём on 01.12.2025.
//

import Foundation
import Combine

class MusicViewModel: ObservableObject {
    
    private let jamendoService: JamendoService
    
    @Published var searchText = ""
    @Published var errorMessage: String?
    @Published var tracks = [Track]()
    @Published var albums = [Album]()
    
    init(jamendoService: JamendoService) {
        self.jamendoService = jamendoService
    }
    
    func loadPopularAlbums() async {
        do {
            albums = try await jamendoService.fetchPopularAlbums(limit: 20)
        } catch {
            errorMessage = error.localizedDescription
            albums = []
        }
    }
    
    func loadPopularTracks() async {
        do {
            tracks = try await jamendoService.fetchPopularTracks(limit: 20)
        } catch {
            errorMessage = error.localizedDescription
            tracks = []
        }
    }
    var filteredTracks: [Track] {
        guard !searchText.isEmpty else { return tracks }
        return tracks.filter { track in
            track.name.lowercased().contains(searchText.lowercased())
        }
        
    }
}
