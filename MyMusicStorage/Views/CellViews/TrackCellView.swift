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
            AsyncImage(url: URL(string: track.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 75, height: 75)

            VStack(alignment: .leading, spacing: 4) {
                Text(track.artistName)
                    .font(.headline)
                
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
//        .background(Color(.systemBackground))
//        .cornerRadius(12)
//        .shadow(color: .gray.opacity(0.2), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    TrackCellView(track: Track(id: "1", name: "1", artistName: "1", image: "1"))
}
