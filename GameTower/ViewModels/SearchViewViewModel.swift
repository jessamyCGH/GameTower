//
//  SearchViewViewModel.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI
import CoreData
import Combine

class SearchViewViewModel: ObservableObject {
    private let context: NSManagedObjectContext
    @Published var videoGames: [VideoGame] = []
    @Published var searchText: String = "" {
        didSet {
            filterGames()
        }
    }
    private var allGames: [VideoGame] = []
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchStoredGames()
    }
        
    func fetchStoredGames() {
        let fetchRequest = NSFetchRequest<VideoGameEntity>(entityName: "VideoGameEntity")

        do {
            let storedGames = try context.fetch(fetchRequest)
            allGames = storedGames.map { entity in
                VideoGame(
                    id: Int(entity.id),
                    title: entity.title ?? "Sin título",
                    shortDescription: entity.shortdescription ?? "",
                    genre: entity.genre ?? "Desconocido",
                    thumbnail: entity.thumbnail ?? "",
                    gameURL: entity.gameurl ?? "",
                    releaseDate: entity.releasedate ?? "",
                    platform: entity.platform ?? "Desconocido",
                    publisher: entity.publisher ?? "",
                    developer: entity.developer ?? "",
                    freetogameProfileUrl: entity.freetogameprofileurl ?? ""
                )
            }
            filterGames()
        } catch {
            print("Error al recuperar juegos de Core Data: \(error)")
        }
    }
    
    func filterGames() {
        if searchText.isEmpty {
            videoGames = allGames
        } else {
            videoGames = allGames.filter { game in
                game.title.localizedCaseInsensitiveContains(searchText) ||
                game.genre.localizedCaseInsensitiveContains(searchText) ||
                game.shortDescription.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
