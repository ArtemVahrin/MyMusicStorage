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
        LazyVStack {
            AlbumImageView(url: album.image)
            
            Text(album.name)
                .font(.headline)
            
            Text(album.artistName)
                .font(.subheadline)
        }
        .padding()
    }
}
struct AlbumImageView: View {
    var url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url), content: { phase in
            switch phase {
            case .success(let image):
                image.resizable()
            case .empty:
                ProgressView()
            case .failure(let error):
                if !error.localizedDescription.isEmpty {
                    AlbumImageView(url: url)
                } else {
                    Image(systemName: "music.note")
                }
            @unknown default:
                EmptyView()
            }
        })
        .frame(width: 150, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    AlbumCellView(album: Album(id: "", name: "", artistName: "", image: "", tracks: []))
}
