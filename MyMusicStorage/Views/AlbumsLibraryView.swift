//
//  AlbumsLibraryView.swift
//  MyMusicStorage
//
//  Created by Артём on 03.12.2025.
//

import SwiftUI

struct AlbumsLibraryView: View {
    var albums = [Album]()
    let onToggleFavorite: (Album) -> ()
    let isFavoriteAlbum: (String) -> Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [columnSize]) {
                        ForEach(albums) { album in
                            AlbumCellViewNavigation(album: album, onToggleFavorite: onToggleFavorite, isFavoriteAlbum: isFavoriteAlbum(album.id))
                        }
                    }
                }
            }
        }
    }
    
    private let columnSize = GridItem(.adaptive(minimum: 150, maximum: .infinity), spacing: 8, alignment: .top)
}

//#Preview {
//    AlbumsLibraryView()
//}
