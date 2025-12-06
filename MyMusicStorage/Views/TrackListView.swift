//
//  TrackListView.swift
//  MyMusicStorage
//
//  Created by Артём on 02.12.2025.
//

import SwiftUI

struct TrackListView: View {
    var album: Album
    let onToggleFavorite: (Album) -> ()
    @State var isFavoriteAlbum: Bool
    
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
                AlbumCellView(album: album)
                    .scaleEffect(1.3)
            }
            
            HStack(spacing: 20) {
                Button { //Like button
                    onToggleFavorite(album)
                    isFavoriteAlbum.toggle()
                } label: {
                    Image(systemName: isFavoriteAlbum ? "heart.fill" : "heart")
                        .padding()
                    
                }

                Button { //Share Button
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .padding()
                }
                .frame(width: 50, height: 50)

            }
            .padding()
            ScrollView() {
                ForEach(album.tracks.sorted()) { track in
                    TrackCellView(track: track)
                }
            }
        }
    }
}

//#Preview {
//    TrackListView(album: Album(id: "", name: "", artistName: "", image: "", tracks: []), onTogglefavorite: )
//}
