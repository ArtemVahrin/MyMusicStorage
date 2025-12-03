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
        VStack() {
            ForEach(albums) { album in
                Text(album.artistName)
            }
        }
    }
}

#Preview {
    AlbumsLibraryView()
}
