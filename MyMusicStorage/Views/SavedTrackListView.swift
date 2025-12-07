//
//  SavedTrackListView.swift
//  MyMusicStorage
//
//  Created by Артём on 04.12.2025.
//

import SwiftUI

struct SavedTrackListView: View {
    var albums: [FavoriteAlbum]
    var onToggleFavorite: (Album) -> ()
    var isFavoriteAlbum: (String) -> Bool
    
    var body: some View {
        if !albums.isEmpty {
            AlbumsLibraryView(albums:
                                albums.map({ $0.toAlbum()}),
                              onToggleFavorite: onToggleFavorite,
                              isFavoriteAlbum: isFavoriteAlbum)
        } else {
            Text("No Saved albums")
        }
    }
}

//#Preview {
//    SavedTrackListView(tracks: [FavoriteTrack(id: "1", name: "2", duration: "222")])
//}
