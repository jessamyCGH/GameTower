//
//  BannerView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI

struct BannerView: View {
    var game: VideoGame
    var onTapGame: (_ game: VideoGame) -> Void
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: game.thumbnail)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 80)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(game.title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                
                Text("Categoría: \(game.genre)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
                
                Text(game.shortDescription)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
            
            Spacer()
        }
        .padding(10)
        .background(Color (hex: "#FAFAFA"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
        .padding(.horizontal, 5)
        .onTapGesture {
            onTapGame(game)
        }
    }
}
