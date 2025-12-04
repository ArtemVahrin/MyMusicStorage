//
//  TrackCellView.swift
//  MyMusicStorage
//
//  Created by Артём on 02.12.2025.
//

import SwiftUI

struct TrackCellView: View {
    var track: Track
    @State var isPresented = false
    
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
            
            Button() {
                isPresented.toggle()
            } label: {
                Image(systemName: "heart") // add change systemImage at button Press
            }
        }
        .padding()
    }
}

#Preview {
    TrackCellView(track: Track(id: "1", name: "1", position: "1"))
}
