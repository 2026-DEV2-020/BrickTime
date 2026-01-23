//
//  Untitled.swift
//  BrickTime
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import SwiftUI

struct BrickTimeView: View {
        
    @StateObject var viewModel: BrickTimeViewModel
        
    var body: some View {
        
        VStack(spacing: 20) {
            VStack(spacing: 4) {
                Text("Time")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Text(viewModel.formattedTime)
                    .font(.system(size: 32,
                                  weight: .bold,
                                  design: .monospaced)
                    )
            }
        }
        
        VStack(spacing: 12) {
            LightView(light: viewModel.time.seconds ? .yellow : .off)
            LightRowView(lights: viewModel.time.fiveHours)
            LightRowView(lights: viewModel.time.singleHours)
            LightRowView(lights: viewModel.time.fiveMinutes)
            LightRowView(lights: viewModel.time.singleMinutes)
        }
        .padding()
    }
}
