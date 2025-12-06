//
//  DataStorage.swift
//  MyMusicStorage
//
//  Created by Артём on 04.12.2025.
//
//
import Foundation
import SwiftData

class FavoriteRepository {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    //MARK: -Tracks
    func addToFavorites(_ track: Track) throws {
        let favorite = FavoriteTrack(track: track)
        modelContext.insert(favorite)
        try modelContext.save()
    }
    
    func removeFromFavorites(_ trackId: String) throws {
        let descriptor = FetchDescriptor<FavoriteTrack>(predicate: #Predicate { $0.id == trackId })
        
        if let track = try modelContext.fetch(descriptor).first {
            modelContext.delete(track)
            try modelContext.save()
        }
    }
    
    func isFavorite(trackId: String) -> Bool {
        let descriptor = FetchDescriptor<FavoriteTrack>(predicate: #Predicate { $0.id == trackId })
        
        do {
            let count = try modelContext.fetchCount(descriptor)
            return count > 0
        } catch {
            return false
        }
    }
    
    func getAllFavorites() -> [FavoriteTrack] {
        let descriptor = FetchDescriptor<FavoriteTrack>(sortBy: [SortDescriptor<FavoriteTrack>(\.addedDate, order: .reverse)])
        
        do {
            return try modelContext.fetch(descriptor)
        } catch {
            print("Error fetching favorites: \(error)")
            return []
        }
    }
    
    //MARK: -Albums
    func getAllFavoriteAlbums() -> [FavoriteAlbum] {
        let descriptor = FetchDescriptor<FavoriteAlbum>()
        
        do {
            return try modelContext.fetch(descriptor)
        } catch {
            print("Error fetching favorites: \(error)")
            return []
        }
    }
    
    func addAlbumToFavorite(_ album: Album) throws {
        let favorite = FavoriteAlbum(album: album)
        modelContext.insert(favorite)
        try modelContext.save()
    }
    
    func removeAlbumFromFavorites(_ albumId: String) throws {
        let descriptor = FetchDescriptor<FavoriteAlbum>(predicate: #Predicate { $0.id == albumId })
        
        if let track = try modelContext.fetch(descriptor).first {
            modelContext.delete(track)
            try modelContext.save()
        }
    }
    
    func isFavorite(albumId: String) -> Bool {
        let descriptor = FetchDescriptor<FavoriteAlbum>(predicate: #Predicate { $0.id == albumId })
        
        do {
            let count = try modelContext.fetchCount(descriptor)
            return count > 0
        } catch {
            return false
        }
    }
}
