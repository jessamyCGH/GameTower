//
//  VideoGameViewModel.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez on 07/02/25.
//

import SwiftUI
import CoreData
import Combine

class VideoGameViewModel: ObservableObject {
    @Published var videoGames: [VideoGame] = []
    @Published var searchText = ""

    private let context: NSManagedObjectContext
    private let service: VideoGameServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(service: VideoGameServiceProtocol = VideoGameService(), context: NSManagedObjectContext) {
        self.service = service
        self.context = context
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
                self?.saveGamesToCoreData(games)
            })
            .store(in: &cancellables)
    }

    private func saveGamesToCoreData(_ games: [VideoGame]) {
        for game in games {
            let entity = NSEntityDescription.entity(forEntityName: "VideoGameEntity", in: context)!
            let videoGame = NSManagedObject(entity: entity, insertInto: context)
            videoGame.setValue(game.id, forKey: "id")
            videoGame.setValue(game.title, forKey: "title")
            videoGame.setValue(game.shortDescription, forKey: "shortdescription")
            videoGame.setValue(game.genre, forKey: "genre")
            videoGame.setValue(game.thumbnail, forKey: "thumbnail")
            videoGame.setValue(game.gameURL, forKey: "gameurl")
            videoGame.setValue(game.releaseDate, forKey: "releasedate")
        }

        do {
            try context.save()
        } catch {
            print("Failed to save games: \(error)")
        }
    }
}
