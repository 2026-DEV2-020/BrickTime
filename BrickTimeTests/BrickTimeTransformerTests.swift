//
//  BrickTimeTransformerTests.swift
//  BrickTimeTests
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import Testing
@testable import BrickTime

struct BrickTimeTransformerTests {
    
    @Test("Midnight should turn all lights off")
    func testMidnight() {
        
        let transformer = BrickTimeTransformer()
        let time = transformer.transforme(hour: 0, minutes: 0, seconds: 0)
        
        #expect(time.seconds == true)
        #expect(time.fiveHours == [.off, .off, .off, .off])
        #expect(time.singleHours == [.off, .off, .off, .off])
        #expect(time.fiveMinutes == Array(repeating: .off, count: 11))
        #expect(time.singleHours == [.off, .off, .off, .off])
    }
    
    @Test("13:00 lights correct hour rows")
    func testHourRowsConversion() {
        
        let transformer = BrickTimeTransformer()
        let time = transformer.transforme(hour: 13, minutes: 0, seconds: 0)
        
        #expect(time.fiveHours == [.red, .red, .off, .off])
        #expect(time.singleHours == [.red, .red, .red, .off])
    }
}
