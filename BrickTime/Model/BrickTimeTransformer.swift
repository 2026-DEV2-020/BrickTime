//
//  BrickTimeTransformer.swift
//  BrickTime
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import Foundation

struct BrickTimeTransformer {
    
    func transforme(hour: Int, minutes: Int, seconds: Int) -> BrickTimeState {
        BrickTimeState (
            seconds: false,
            fiveHours: [],
            singleHours: [],
            fiveMinutes: [],
            singleMinutes: []
        )
    }
}
