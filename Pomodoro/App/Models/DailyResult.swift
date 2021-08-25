//
//  DailyResult.swift
//  Pomodoro
//
//  Created by zac on 2021/08/21.
//

import Foundation

enum DailyResult {
    case phenomenal, verygood, good, bad, verybad, terrible
    
    var message: String {
        switch self {
        case .phenomenal: return "You've collected \(dailyPomodoro.pomodoroBasket.count) 🍅 today. 💎"
        case .verygood: return "You've collected \(dailyPomodoro.pomodoroBasket.count) 🍅  today. 💡"
        case .good: return "You've collected \(dailyPomodoro.pomodoroBasket.count) 🍅 today. 😈"
        case .bad: return "You've collected \(dailyPomodoro.pomodoroBasket.count) 🍅 today. 😵‍💫"
        case .verybad: return "You've collected \(dailyPomodoro.pomodoroBasket.count) 🍅 today. ⚠️"
        case .terrible: return "You've collected \(dailyPomodoro.pomodoroBasket.count) 🍅 today. 🧨"
        }
    }
}



