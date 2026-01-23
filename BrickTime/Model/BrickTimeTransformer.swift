//
//  BrickTimeTransformer.swift
//  BrickTime
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import Foundation

// MARK: - protocols
protocol BrickTimeTransforming {
    func transforme(hour: Int, minutes: Int, seconds: Int) -> BrickTimeState
}

// MARK: - structs
struct BrickTimeTransformer: BrickTimeTransforming {
    
    // MARK: - init
    public init() {}
    
    // MARK: - public funcs
    public func transforme(hour: Int, minutes: Int, seconds: Int) -> BrickTimeState {
        BrickTimeState (
            seconds: true,
            fiveHours: [.off, .off, .off, .off],
            singleHours: [.off, .off, .off, .off],
            fiveMinutes: Array(repeating: .off, count: 11),
            singleMinutes: [.off, .off, .off, .off]
        )
    }
}
