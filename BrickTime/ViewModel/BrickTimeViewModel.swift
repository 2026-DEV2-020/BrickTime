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
    private(set) var formattedTime: String = "00:00:00"
    
    private let transformer: BrickTimeTransforming
    private let clock: ClockProviding
    private var timer: AnyCancellable?
    
    // MARK: - init
    init(transformer: BrickTimeTransforming, clock: ClockProviding) {
        
        self.transformer = transformer
        self.clock = clock
        
        self.updateTime(clock, transformer)
    }
    
    // MARK: - private funcs
    private func updateTime(_ clock: any ClockProviding, _ transformer: any BrickTimeTransforming) {
        let date = clock.now()
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        
        let hour = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        self.time = transformer.transform(hour: hour, minutes: minutes, seconds: seconds)
        self.formattedTime = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
    }
}
