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

@MainActor
final class BrickTimeViewModel: ObservableObject {
    
    // MARK: - private properties
    @Published private(set) var time: BrickTimeState
    @Published private(set) var formattedTime: String = "00:00:00"
    
    private let transformer: BrickTimeTransforming
    private let clock: ClockProviding
    private var timer: AnyCancellable?
    
    // MARK: - init
    init(transformer: BrickTimeTransforming, clock: ClockProviding) {
        
        self.transformer = transformer
        self.clock = clock
        
        let (state, formattedTime) = Self.makeState(from: clock.now(), transformer: transformer)

        self.time = state
        self.formattedTime = formattedTime
        

        start()
    }
    
    // MARK: - private funcs
    
    private func start() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                self.updateTime(clock, transformer)
            }
    }
    
    private func updateTime(_ clock: any ClockProviding, _ transformer: any BrickTimeTransforming) {
        let (state, formattedTime) = Self.makeState(from: clock.now(), transformer: transformer)
        self.time = state
        self.formattedTime = formattedTime
    }
    
    private static func makeState(from date: Date, transformer: BrickTimeTransforming) -> (BrickTimeState, String) {
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: date)
        
        let hour = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        let state = transformer.transform(hour: hour, minutes: minutes, seconds: seconds)
        let formattedTime = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
        
        return (state, formattedTime)
    }
}
