//
//  BrickTimeViewModel.swift
//  BrickTime
//
//  Created by 2026-DEV2-020 on 23/01/2026.
//

import Foundation

final class BrickTimeViewModel {
    
    // MARK: - private properties
    private(set) var time: BrickTimeState
    private(set) var formattedTime: String
    private let tranformer: BrickTimeTransforming
    
    // MARK: - init
    init(tranformer: BrickTimeTransforming) {
        self.tranformer = tranformer
        
        let initialTime = tranformer.transforme(hour: 0, minutes: 0, seconds: 0)
        self.time = initialTime
        self.formattedTime = "00:00:00"
    }
}
