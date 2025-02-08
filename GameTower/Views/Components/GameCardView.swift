//
//  GameCardView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI

struct GameCardView: View {
    let game: VideoGame
    let onTapView: (_ game: VideoGame) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: game.thumbnail)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 60)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            
            Text(game.title)
                .font(.system(size: 15, weight: .bold))
                .padding(.top, 5)
                .lineLimit(2)
            
            Text("Categoría: \(game.genre)")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.gray)
                .lineLimit(1)
            
            Text(game.shortDescription)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.secondary)
                .lineLimit(3)
        }
        .frame(height: 150)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        .padding(.horizontal)
        .onTapGesture {
            onTapView(game)
        }
    }
}
