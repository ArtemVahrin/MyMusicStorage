//
//  AlbumsLibraryView.swift
//  MyMusicStorage
//
//  Created by Артём on 03.12.2025.
//

import SwiftUI

struct AlbumsLibraryView: View {
    var albums = [Album]()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [columnSize]) {
                    ForEach(albums) { album in
                        AlbumCellView(album: album)
                    }
                }
            }
            .navigationTitle("My ALbum Library")
        }
    }
    private let columnSize = GridItem(.adaptive(minimum: 150, maximum: .infinity), spacing: 8, alignment: .top)
}

#Preview {
    AlbumsLibraryView()
}
