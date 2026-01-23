//
//  BrickTimeViewModelTests.swift
//  BrickTimeTests
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import Testing
@testable import BrickTime

struct BrickTimeViewModelTests {

    @Test("ViewModel initial state with at midnight")
    func initialState() {
        
        let transformer = BrickTimeTransformer()
        let viewModel = BrickTimeViewModel(tranformer: transformer)
        
        #expect(viewModel.time == transformer.transforme(hour: 0, minutes: 0, seconds: 0))
        #expect(viewModel.formattedTime == "00:00:00")
    }
}
