//
//  BrickTimeViewModel.swift
//  BrickTime
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import Foundation
import Combine

protocol ClockProviding {
    func now() -> Date
}

final class SystemClock: ClockProviding {
    func now() -> Date {
        Date()
    }
}

final class BrickTimeViewModel {
    
    // MARK: - private properties
    private(set) var time: BrickTimeState?
    private(set) var formattedTime: String?
    
    private let transformer: BrickTimeTransforming
    private let clock: ClockProviding
    private var timer: AnyCancellable?
    
    // MARK: - init
    init(transformer: BrickTimeTransforming, clock: ClockProviding) {
        
        self.transformer = transformer
        self.clock = clock
        
        let initialTime = transformer.transform(hour: 0, minutes: 0, seconds: 0)
        self.time = initialTime
        self.formattedTime = "00:00:00"
    }
}
