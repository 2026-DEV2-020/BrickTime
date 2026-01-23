//
//  LightView.swift
//  BrickTime
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import SwiftUI

struct LightView: View {
    
    let light: Light
    
    private var color: Color {
        switch light {
        case .off: return .gray
        case .red: return .red
        case .yellow: return .yellow
        }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(color)
            .frame(width: 24, height: 24)
    }
}

struct LightRowView: View {
    
    let lights: [Light]
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(lights.indices, id: \.self) {
                LightView(light: lights[$0])
            }
        }
    }
}
