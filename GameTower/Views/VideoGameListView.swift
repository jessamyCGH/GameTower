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
    @State private var carouselIndex = 0
    @EnvironmentObject var coordinator: AppCoordinator
    
    init(context: NSManagedObjectContext) {
        _viewModel = StateObject(wrappedValue: VideoGameViewModel(context: context))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("Buscar")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        coordinator.showSearchView()
                    }
                    .padding(12)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Text("Destacados y recomendados")
                        .font(.system(size: 20, weight: .bold))
                    
                    TabView(selection: $carouselIndex) {
                        ForEach(Array(viewModel.videoGames.prefix(5).enumerated()), id: \.offset) { index, game in
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
                            .onTapGesture {
                                viewModel.handleGameTap(game: game, coordinator: coordinator)
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 200)
                    .onReceive(Timer.publish(every: 5, on: .main, in: .common).autoconnect()) { _ in
                        withAnimation {
                            carouselIndex = (carouselIndex + 1) % min(5, viewModel.videoGames.count)
                        }
                    }
                    
                    Text("Lo más vendido")
                        .font(.system(size: 20, weight: .bold))
                    
                    ForEach(Array(viewModel.videoGames.dropFirst(6).prefix(7)), id: \.id) { game in
                        BannerView(game: game) { gameSelected in
                            viewModel.handleGameTap(game: gameSelected,coordinator: coordinator)
                        }
                    }
                    
                    Text("Explora tu categoría")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 15)
                    
                    if let selectedCategory = viewModel.selectedCategory {
                        CategoryTagView(genre: selectedCategory, onRemove: viewModel.handleRemoveCategorySelection)
                        ForEach(viewModel.filteredGamesByCategory, id: \.id) { game in
                            BannerView(game: game) { gameSelected in
                                viewModel.handleGameTap(game: gameSelected, coordinator: coordinator)
                            }
                        }
                    } else {
                        CategoryGridView(viewModel: viewModel, categories: viewModel.uniqueCategories)
                    }
                    
                    Text("Explora tu plataforma")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 15)
                    
                    if let selectedPlatform = viewModel.selectedPlatform {
                        PlatformTagView(platform: selectedPlatform, onRemove: viewModel.handleRemovePlatformSelection)
                        ForEach(viewModel.filteredGamesByPlatform, id: \.id) { game in
                            BannerView(game: game) { gameSelected in
                                viewModel.handleGameTap(game: gameSelected, coordinator: coordinator)
                            }
                        }
                    } else {
                        PlatformGridView(viewModel: viewModel, platforms: viewModel.uniquePlatforms)
                    }
                }
                .padding(.horizontal, 15)
            }
            .onAppear {
                viewModel.fetchVideoGames()
            }
        }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
