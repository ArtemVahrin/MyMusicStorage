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
    @State var isAlbum: Bool = true
    
    var body: some View {

        Picker("Favorite", selection: $isAlbum) {
            Text("Favorite tracks")
                .tag(false)
            Text("Favorite albums")
                .tag(true)
        }
        .pickerStyle(.segmented)
        
        Spacer()
        
        switch isAlbum {
        case false:
            Text("There is a tracks")
        case true:
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
}

//#Preview {
//    SavedTrackListView(tracks: [FavoriteTrack(id: "1", name: "2", duration: "222")])
//}
