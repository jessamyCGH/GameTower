//
//  VideoGameListView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI
import CoreData

struct VideoGameListView: View {
    @StateObject private var viewModel: VideoGameViewModel

    init(context: NSManagedObjectContext) {
        
        _viewModel = StateObject(wrappedValue: VideoGameViewModel(context: context))
  
    }
    var body: some View {
        NavigationView {
            List(viewModel.videoGames) { game in
                
            }
            .navigationTitle("Videojuegos")
        }
        .onAppear {
            viewModel.fetchVideoGames()
        }
    }
}

