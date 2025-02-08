//
//  SearchView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI
import CoreData

struct SearchView: View {
    @StateObject private var viewModel: SearchViewViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var coordinator: AppCoordinator
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: SearchViewViewModel(context: context))
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Button(action: {
                    coordinator.showListView()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Buscar", text: $viewModel.searchText)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(12)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                
            }
            .padding(.horizontal)
            
            Text("Mejores resultados")
                .frame(maxWidth: .infinity,  alignment: .leading)
                .font(.system(size: 20, weight: .bold))
                .padding(.leading, 18)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(viewModel.videoGames, id: \ .id) { game in
                        GameCardView(game: game)
                    }
                }
                .padding()
            }
        }
    }
}
