//
//  BrickTimeViewModelTests.swift
//  BrickTimeTests
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import Testing
import Foundation
@testable import BrickTime

struct BrickTimeViewModelTests {

    struct FakeClock: ClockProviding {
        var currentDate: Date
        
        init(initial: Date) {
            self.currentDate = initial
        }
        
        func now() -> Date {
            currentDate
        }
    }
    
    @Test("ViewModel initial state with at midnight")
    func initialState() async {
        
        let calendar = Calendar(identifier: .gregorian)
        let date = calendar.date(from: DateComponents(hour:0, minute: 0, second: 0))!
        
        let transformer = BrickTimeTransformer()
        let viewModel = await BrickTimeViewModel(transformer: transformer, clock: FakeClock(initial: date))
        
        await #expect(viewModel.time == transformer.transform(hour: 0, minutes: 0, seconds: 0))
        await #expect(viewModel.formattedTime == "00:00:00")
    }
    
    @Test("View Model updates time model from clock")
    func updatesTimeFromClock() async throws {
        
        let calendar = Calendar(identifier: .gregorian)
        let initialDate = calendar.date(from: DateComponents(hour: 12, minute: 5, second: 9))!
        
        let clock = FakeClock(initial: initialDate)
        let transformer = BrickTimeTransformer()
        let viewModel = await BrickTimeViewModel(transformer: transformer, clock: clock)
        
        await #expect(viewModel.time.seconds == false)
        await #expect(viewModel.time.fiveHours == [.red, .red, .off, .off])
        await #expect(viewModel.time.singleHours == [.red, .red, .off, .off])
        await #expect(viewModel.time.fiveMinutes.prefix(3) == [.yellow, .off, .off])
        await #expect(viewModel.time.singleMinutes == [.off, .off, .off, .off])
    }
    
    @Test("Formatted time icludes, hours, minutes and seconds")
    func testFormattedTime() async {
        
        let calendar = Calendar(identifier: .gregorian)
        let initialDate = calendar.date(from: DateComponents(hour: 12, minute: 5, second: 9))!
        
        let clock = FakeClock(initial: initialDate)
        let transformer = BrickTimeTransformer()
        let viewModel = await BrickTimeViewModel(transformer: transformer, clock: clock)

        try? await Task.sleep(nanoseconds: 1_000_000)
        await #expect(viewModel.formattedTime == "12:05:09")
    }
}
