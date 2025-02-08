//
//  AppCoordinator.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez on 07/02/25.
//


import SwiftUI
import CoreData

class AppCoordinator: ObservableObject {
    @Published var rootView: AnyView
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.rootView = AnyView(EmptyView())
        setupRootView()
    }
    
    private func setupRootView() {
        rootView = AnyView(VideoGameListView(context: context).environmentObject(self))
    }
    
    func showListView() {
        rootView = AnyView(VideoGameListView(context: context).environmentObject(self))
    }
    
    func showSearchView() {
        rootView = AnyView(SearchView(context: context).environmentObject(self))
    }
    
    func showVideoGameDetailView(game: VideoGame) {
        rootView = AnyView(VideoGameDetailView(game: game))
    }
}
