//
//  BrickTimeApp.swift
//  BrickTime
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import SwiftUI
import SwiftData

@main
struct BrickTimeApp: App {
    
    var body: some Scene {
        WindowGroup {
            BrickTimeView(
                viewModel:
                    BrickTimeViewModel(
                        transformer: BrickTimeTransformer(),
                        clock: SystemClock()))
        }
    }
}
