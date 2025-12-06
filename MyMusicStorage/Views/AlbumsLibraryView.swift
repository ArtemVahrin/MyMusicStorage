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
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Library List")
                    .font(.largeTitle)
                    .bold()
             
                ScrollView {
                    LazyVGrid(columns: [columnSize]) {
                        ForEach(albums) { album in
                            AlbumCellViewNavigation(album: album, onToggleFavorite: onToggleFavorite)
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
