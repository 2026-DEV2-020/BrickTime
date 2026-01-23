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
            seconds: seconds % 2 == 0,
            fiveHours: row(count: hour / 5, total: 4, color: .red),
            singleHours: row(count: hour % 5, total: 4, color: .red),
            fiveMinutes: fiveMinutesRow(minutes: minutes),
            singleMinutes: row(count: minutes % 5, total: 4, color: .yellow)
        )
    }
    
    // MARK: - private funcs
    private func row(count: Int, total: Int, color: Light) -> [Light] {
        (0..<total).map { $0 < count ? color : .off }
    }
    
    private func fiveMinutesRow(minutes: Int) -> [Light] {
        (1...11).map {
            guard $0 <= minutes / 5 else { return .off }
            return $0 % 3 == 0 ? .red : .yellow
        }
    }
}
