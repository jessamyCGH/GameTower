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
    @Published var uniqueCategories: [String] = []
    @Published var uniquePlatforms: [String] = []
    @Published var selectedCategory: String?
    @Published var selectedPlatform: String?
    @Published var filteredGamesByCategory: [VideoGame] = []
    @Published var filteredGamesByPlatform: [VideoGame] = []
    
    
    
    
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
                self?.uniqueCategories = Array(Set(games.map { $0.genre })).sorted()
                self?.uniquePlatforms = Array(Set(games.map { $0.platform })).sorted()
            })
            .store(in: &cancellables)
    }
    
    func handleCategorySelection(_ category: String) {
        selectedCategory = category
        filteredGamesByCategory = videoGames.filter({
            $0.genre == selectedCategory
        })
    }
    
    func handlePlatformSelection(_ platform: String) {
        selectedPlatform = platform
        filteredGamesByPlatform = videoGames.filter({
            $0.platform == selectedPlatform
        })
    }
    
    func handleRemoveCategorySelection(){
        selectedCategory = ""
        filteredGamesByCategory = []
    }
    
    func handleRemovePlatformSelection(){
        selectedPlatform = ""
        filteredGamesByPlatform = []
    }
    
    func handleGameTap(game: VideoGame, coordinator: AppCoordinator) {
        coordinator.showVideoGameDetailView(game: game)
        
    }
    
    private func saveGamesToCoreData(_ games: [VideoGame]) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "VideoGameEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("Error al eliminar los juegos almacenados: \(error)")
        }
        
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
            videoGame.setValue(game.platform, forKey: "platform")
            videoGame.setValue(game.publisher, forKey: "publisher")
            videoGame.setValue(game.developer, forKey: "developer")
            videoGame.setValue(game.freetogameProfileUrl, forKey: "freetogameprofileurl")
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to save games: \(error)")
        }
    }
}
