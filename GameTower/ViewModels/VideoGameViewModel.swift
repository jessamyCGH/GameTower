//
//  VideoGameViewModel.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez on 07/02/25.
//

import SwiftUI
import Combine

class VideoGameViewModel: ObservableObject {
    @Published var videoGames: [VideoGame] = []
    @Published var searchText = ""

    private let service: VideoGameServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(service: VideoGameServiceProtocol = VideoGameService()) {
        self.service = service
        fetchVideoGames()
    }

    func fetchVideoGames() {
        service.fetchGames()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
            }, receiveValue: { [weak self] games in
                self?.videoGames = games
            })
            .store(in: &cancellables)
    }
}
