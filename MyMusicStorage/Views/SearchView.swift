//
//  SearchView.swift
//  MyMusicStorage
//
//  Created by Артём on 07.12.2025.
//

import SwiftUI

struct SearchView: View {
    let albums: [Album]
    let onToggleFavorite: (Album) -> ()
    let isFavoriteAlbum: (String) -> Bool
    
    @Binding var searchFromAPItext: String
    let onCommit: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("Search albums", text: $searchFromAPItext, onCommit: onCommit)
            
            if !searchFromAPItext.isEmpty {
                Button {
                    searchFromAPItext = ""
                    onCommit()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color.gray)
                }

            }
        }
        .padding()
        Spacer()
        
        AlbumsLibraryView(albums: albums, onToggleFavorite: onToggleFavorite, isFavoriteAlbum: isFavoriteAlbum)
    }
}

//#Preview {
//    SearchView(searchFromAPI: )
//}
