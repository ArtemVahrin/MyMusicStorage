//
//  ViewModel.swift
//  MyMusicStorage
//
//  Created by Артём on 01.12.2025.
//

import Foundation
import Combine

class MusicViewModel: ObservableObject {
    
    private let jamendoService: JamendoService
    @Published var errorMessage: String?
    @Published var tracks = [Track]()
    
    init(jamendoService: JamendoService) {
        self.jamendoService = jamendoService
    }
    
    func loadPopularTracks() async {
        do {
            tracks = try await jamendoService.fetchPopularTracks(limit: 20)
        } catch {
            errorMessage = error.localizedDescription
            tracks = []
        }
    }
}
