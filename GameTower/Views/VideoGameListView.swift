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
    @State private var selectedCategory: String?
    @State private var selectedPlatform: String?
    @State private var carouselIndex = 0
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: VideoGameViewModel(context: context))
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
                Text("Destacados y recomendados")
                    .frame(maxWidth: .infinity,  alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    
                TabView(selection: $carouselIndex) {
                    ForEach(viewModel.videoGames.prefix(5).indices, id: \..self) { index in
                        if let game = viewModel.videoGames[safe: index] {
                            AsyncImage(url: URL(string: game.thumbnail)) { image in
                                image.resizable()
                                     .scaledToFill()
                                     .frame(width: UIScreen.main.bounds.width - 30, height: 200)
                                     
                                     .clipped()
                            } placeholder: {
                                ProgressView()
                            }
                            .cornerRadius(10)
                            .tag(index)
                            
                        }
                    }
                }
                
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height : 200)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                        withAnimation {
                            carouselIndex = (carouselIndex + 1) % min(5, viewModel.videoGames.count)
                        }
                    }
                }
                
                Text("Lo mas vendido")
                    .frame(maxWidth: .infinity,  alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                
                ForEach(viewModel.videoGames.dropFirst(6).prefix(7).indices, id: \.self) { index in
                    if let game = viewModel.videoGames[safe: index] {
                        BannerView(image: game.thumbnail, title: game.title, category: game.genre, description: game.shortDescription)
                    }
                }
                
                Text("Explora tu categoria")
                    .frame(maxWidth: .infinity,  alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 15)
                
                CategoryGridView(categories: viewModel.uniqueCategories)
                
                Text("Explora tu plataforma")
                    .frame(maxWidth: .infinity,  alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 15)
                
                CategoryGridView(categories: viewModel.uniquePlatforms)
                
                
            }
            .padding(.horizontal , 15)
        }
        
        .onAppear {
            viewModel.fetchVideoGames()
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
