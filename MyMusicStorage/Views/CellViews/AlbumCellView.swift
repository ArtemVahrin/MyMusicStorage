//
//  AlbumCellView.swift
//  MyMusicStorage
//
//  Created by Артём on 04.12.2025.
//

import SwiftUI

struct AlbumCellView: View {
    var album: Album
    
    var body: some View {
        LazyVStack() {
            AsyncImage(url: URL(string: album.image), content: { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                case .empty:
                    ProgressView()
                case .failure(_):
                    Image(systemName: "music.note")
                @unknown default:
                    EmptyView()
                }
            })
            .frame(width: 150, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text(album.name)
                .lineLimit(1)
                .font(.headline)
            
            Text(album.artistName)
                .font(.subheadline)
                .lineLimit(1)
        }
        .padding()
    }
}

#Preview {
    AlbumCellView(album: Album(id: "", name: "", artistName: "", image: "", tracks: []))
}
