//
//  TrackCellView.swift
//  MyMusicStorage
//
//  Created by Артём on 02.12.2025.
//

import SwiftUI

struct TrackCellView: View {
    @State private var isSaved = false
    var track: Track
    
    var body: some View {
        HStack {
            HStack(spacing: 20) {
                Text(track.position)
                    .font(.subheadline)
                
                Text(track.name)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        
            Spacer()
            
//MARK: Save Button
//            Button() {
//                isSaved.toggle()
//            } label: {
//                Image(systemName: isSaved ? "heart.fill" : "heart") // add change systemImage at button Press
//            }
        }
        .padding()
    }
}

//#Preview {
//    TrackCellView(track: Track(id: "1", name: "1", position: "1", duration: ""))
//}
