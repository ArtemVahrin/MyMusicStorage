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
            TabView {
                Tab("Popular Albums", systemImage: "music.note.list") {
                    VStack {
                        Text("Library List")
                            .font(.largeTitle)
                            .bold()
                        
                        ScrollView {
                            LazyVGrid(columns: [columnSize]) {
                                ForEach(albums) { album in
                                    AlbumCellViewNavigation(album: album)
                                }
                            }
                        }
                    }
                }
                Tab("Saved Tracks", systemImage: "music.note") {
                    VStack {
                        Text("Saved Tracks")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                        
                        TrackCellView(track: Track(id: "1", name: "name", position: "pos"))
                    }
                }
            }
        }
    }
    
    private let columnSize = GridItem(.adaptive(minimum: 150, maximum: .infinity), spacing: 8, alignment: .top)
}

#Preview {
    AlbumsLibraryView()
}
