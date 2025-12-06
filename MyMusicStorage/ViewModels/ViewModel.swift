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
    private let favoritesRepository: FavoriteRepository
    
    @Published var searchText = ""
    @Published var errorMessage: String?
    @Published var albums = [Album]()
    @Published var favoriteTracks = [FavoriteTrack]()
    @Published var favoriteAlbums = [FavoriteAlbum]()
    
    init(jamendoService: JamendoService, favoritesRepository: FavoriteRepository) {
        self.jamendoService = jamendoService
        self.favoritesRepository = favoritesRepository
        loadFavoriteAlbums()
    }
    
    func loadPopularAlbums() async {
        do {
            albums = try await jamendoService.fetchPopularAlbums(limit: 100)
        } catch {
            errorMessage = error.localizedDescription
            albums = []
        }
    }
    
    func loadFavoriteTracks() {
        favoriteTracks = favoritesRepository.getAllFavorites()
    }
    
    var filteredAlbums: [Album] {
        guard !searchText.isEmpty else { return albums }
        return albums.filter { album in
            return album.name.lowercased().contains(searchText.lowercased()) || album.artistName.lowercased().contains(searchText.lowercased())
        }
    }
    
    func toggleFavorite(track: Track) {
        do {
            if favoritesRepository.isFavorite(trackId: track.id) {
                try favoritesRepository.removeFromFavorites(track.id)
            } else {
                try favoritesRepository.addToFavorites(track)
            }
            loadFavoriteTracks()
            
        } catch {
            errorMessage = "Failed to update favorites: \(error.localizedDescription)"
        }
    }
    
    func loadFavoriteAlbums() {
        favoriteAlbums = favoritesRepository.getAllFavoriteAlbums()
    }
    
    func toggleFavorite(album: Album) {
        do {
            if favoritesRepository.isFavorite(albumId: album.id) {
                try favoritesRepository.removeAlbumFromFavorites(album.id)
            } else {
                try favoritesRepository.addAlbumToFavorite(album)
            }
            loadFavoriteAlbums()
            
        } catch {
            errorMessage = "Failed to update favorites: \(error.localizedDescription)"
        }
    }
}
