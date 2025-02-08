//
//  VideoGameDetailView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez on 07/02/25.
//

import SwiftUI
import CoreData

struct VideoGameDetailView: View {
    let game: VideoGame
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        ScrollView {
            HStack {
                Button(action: {
                    coordinator.showListView()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.leading, 15)
            
            VStack(alignment: .leading, spacing: 10) {
                AsyncImage(url: URL(string: game.thumbnail)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                
                Text(game.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                infoRow(title: "Categoría:", value: game.genre)
                infoRow(title: "Plataforma:", value: game.platform)
                infoRow(title: "Publicador:", value: game.publisher)
                infoRow(title: "Desarrollador:", value: game.developer)
                infoRow(title: "Día de lanzamiento:", value: game.releaseDate)
                
                Text(game.shortDescription)
                    .font(.body)
                    .foregroundColor(.gray)
                
                Spacer().frame(height: 20)
                
                Text("Quieres conocer más?")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Button(action: {
                    if let url = URL(string: game.gameURL) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("Visitar página")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer().frame(height: 10)
                
                Text("Quieres jugarlo?")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Button(action: {
                    if let url = URL(string: game.freetogameProfileUrl) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("Descargar juego")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
    
    private func infoRow(title: String, value: String) -> some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
            Text(value)
                .font(.subheadline)
        }
    }
}
