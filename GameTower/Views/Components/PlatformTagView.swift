//
//  PlatformTagView.swift
//  GameTower
//
//  Created by Jessamy Del Carmen Guzman Hernandez  on 07/02/25.
//

import SwiftUI

struct PlatformTagView: View {
    var platform: String
    var onRemove: () -> Void
    
    var body: some View {
        HStack {
            Text(platform)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
            
            Spacer()
            
            Button(action: onRemove) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding(6)
                    .background(Circle().fill(Color.black))
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
