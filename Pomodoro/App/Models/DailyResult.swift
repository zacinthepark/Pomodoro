//
//  DailyResult.swift
//  Pomodoro
//
//  Created by zac on 2021/08/21.
//

import Foundation

struct DailyResult {
    private let pomodoros: Int
    private let accomplishmentLevel: AccomplishmentLevel
    
    init(pomodoros: Int) {
        self.pomodoros = pomodoros
        self.accomplishmentLevel = AccomplishmentLevel(pomodoros: pomodoros)
    }
}

extension DailyResult {
    var message: String {
        switch accomplishmentLevel {
        case .phenomenal: return "You've collected \(pomodoros) ๐ today. ๐"
        case .verygood: return "You've collected \(pomodoros) ๐  today. ๐ก"
        case .good: return "You've collected \(pomodoros) ๐ today. ๐"
        case .bad: return "You've collected \(pomodoros) ๐ today. ๐ตโ๐ซ"
        case .verybad: return "You've collected \(pomodoros) ๐ today. โ ๏ธ"
        case .terrible: return "You've collected \(pomodoros) ๐ today. ๐งจ"
        }
    }
}
