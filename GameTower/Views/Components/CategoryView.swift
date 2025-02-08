//
//  CategoryView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI


struct CategoryView: View {
    var category: String
    var onSelect: (String) -> Void
    
    var body: some View {
        Text(category)
            .frame(width: 120, height: 100)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.black)
            .padding(.vertical, 8)
            .padding(.horizontal, 15)
            .background(Color(hex: "#FAFAFA"))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
            .onTapGesture {
                onSelect(category)
            }
    }
}
