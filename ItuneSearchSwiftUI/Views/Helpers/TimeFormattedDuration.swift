//
//  TimeFormattedDuration.swift
//  ItuneSearchSwiftUI
//
//  Created by rafiul hasan on 22/6/23.
//

import Foundation

class TimeFormattedDuration {
    static func formattedDuration(time: Int) -> String {
        let timeInSeconds = time / 1000
        let interval = TimeInterval(timeInSeconds)
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional        
        return formatter.string(from: interval) ?? ""
    }
}
