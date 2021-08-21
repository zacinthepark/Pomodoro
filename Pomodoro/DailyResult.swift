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
        case .phenomenal: return "You're now UPGRADED. Keep this pace"
        case .verygood: return "Great Work. You can do it better tomorrow"
        case .good: return "Good but not enough. You gotta RUSH"
        case .bad: return "You're RUNNING OUT of time. Tomorrow should be better"
        case .verybad: return "You're RUNNING OUT of time. Tomorrow should better"
        case .terrible: return "You're RUNNING OUT of time. Tomorrow should be better"
        }
    }
}



