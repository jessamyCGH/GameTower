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
        rootView = AnyView(VideoGameListView(context: context))
    }

   
}
