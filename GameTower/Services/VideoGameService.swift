//
//  VideoGameService.swift
//  GameTower
//
//  Created by Jessamy del Carmen Guzman Hernandez on 07/02/25.
//


import Combine
import Foundation

protocol VideoGameServiceProtocol {
    func fetchGames() -> AnyPublisher<[VideoGame], Error>
}

class VideoGameService: VideoGameServiceProtocol {
    private let baseUrl = Constants.baseURL
    
    func fetchGames() -> AnyPublisher<[VideoGame], Error> {
        guard let url = URL(string: baseUrl) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [VideoGame].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
