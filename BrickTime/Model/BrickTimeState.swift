//
//  BrickTimeState.swift
//  BrickTime
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import Foundation

public struct BrickTimeState: Equatable {
    let seconds: Bool
    let fiveHours: [Light]
    let singleHours: [Light]
    let fiveMinutes: [Light]
    let singleMinutes: [Light]
}

public enum Light: Equatable {
    case off
    case red
    case yellow
}
