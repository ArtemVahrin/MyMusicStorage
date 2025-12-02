//
//  TrackListView.swift
//  MyMusicStorage
//
//  Created by Артём on 02.12.2025.
//

import SwiftUI

struct TrackListView: View {
    var tracks = [Track]()
    
    var body: some View {
        ScrollView() {
            ForEach(tracks) { track in
                TrackCellView(track: track)
            }
        }
    }
}

#Preview {
    TrackListView()
}
