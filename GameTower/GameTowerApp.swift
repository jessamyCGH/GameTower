//
//  GameTowerApp.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez on 07/02/25.
//

import SwiftUI

@main
struct GameTowerApp: App {
    @StateObject private var coordinator = AppCoordinator(context: PersistenceController.shared.container.viewContext)

    var body: some Scene {
        WindowGroup {
            coordinator.rootView
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}
