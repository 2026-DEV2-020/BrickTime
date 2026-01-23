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
    
    @Test("17 minutes lights correct minute rows")
    func testMinutesRowsConversion() {
        
        let transformer = BrickTimeTransformer()
        let time = transformer.transforme(hour: 0, minutes: 17, seconds: 0)
        
        #expect(time.fiveMinutes.prefix(3) == [.yellow, .yellow, .red])
        #expect(time.singleMinutes == [.yellow, .yellow, .off, .off])
    }
    
    @Test("Odd seconds should turn the light off")
    func testOddSecondsTurnOff() {
        
        let transformer = BrickTimeTransformer()
        let time = transformer.transforme(hour: 0, minutes: 0, seconds: 1)
        
        #expect(time.seconds == false)
    }
    
    @Test("Even seconds should turn the light on")
    func tesEvenSecondsTurnOn() {
        
        let transformer = BrickTimeTransformer()
        let time = transformer.transforme(hour: 0, minutes: 0, seconds: 2)
        
        #expect(time.seconds == true)
    }
}
