//
//  TrackListView.swift
//  MyMusicStorage
//
//  Created by Артём on 02.12.2025.
//

import SwiftUI

struct TrackListView: View {
    var album: Album
    var body: some View {
        VStack() {
            HStack(alignment: .center) {
                AlbumCellView(album: album)
            }
            ScrollView() {
                ForEach(album.tracks.sorted()) { track in
                    TrackCellView(track: track)
                }
            }
        }
    }
}

#Preview {
    TrackListView(album: Album(id: "", name: "", artistName: "", image: "", tracks: []))
}
