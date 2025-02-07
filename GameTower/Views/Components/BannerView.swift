//
//  BannerView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI

struct BannerView: View {
    var image: String
    var title: String
    var category: String
    var description: String

    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: image)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 80)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)

                Text("Categoría: \(category)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)

                Text(description)
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
    }
}
