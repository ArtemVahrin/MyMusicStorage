//
//  TrackCellView.swift
//  MyMusicStorage
//
//  Created by Артём on 02.12.2025.
//

import SwiftUI

struct TrackCellView: View {
    var track: Track
    
    var body: some View {
        HStack {
            HStack(spacing: 20) {
                Text(track.position)
                    .font(.subheadline)
                
                Text(track.name)
                    .font(.subheadline)
            }
            
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "play.fill")
            }
        }
        .padding()
    }
}

#Preview {
    TrackCellView(track: Track(id: "1", name: "1", position: "1"))
}
