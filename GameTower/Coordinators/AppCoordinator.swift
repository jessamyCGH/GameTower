//
//  AppCoordinator.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez on 07/02/25.
//


import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var rootView: AnyView = AnyView(VideoGameListView())

    
}
