//
//  VideoGameListView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI

struct VideoGameListView: View {
    @StateObject private var viewModel = VideoGameViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.videoGames) { game in}
            .navigationTitle("Videojuegos")
        }
        .onAppear {
            viewModel.fetchVideoGames()
        }
    }
}

