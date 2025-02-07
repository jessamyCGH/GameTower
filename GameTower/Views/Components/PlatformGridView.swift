//
//  PlatformGridView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI

struct PlatformGridView: View {
    @ObservedObject var viewModel: VideoGameViewModel
    let platforms: [String]
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(platforms, id: \.self) { platform in
                PlatformView(platform: platform) { selected in
                    viewModel.handlePlatformSelection(selected)
                }
            }
        }
        .padding(20)
    }
}
