//
//  CategoryGridView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI

struct CategoryGridView: View {
    @ObservedObject var viewModel: VideoGameViewModel
    let categories: [String]
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(categories, id: \.self) { category in
                CategoryView(category: category) { selected in
                    viewModel.handleCategorySelection(selected)
                }
            }
        }
        .padding(20)
    }
}
