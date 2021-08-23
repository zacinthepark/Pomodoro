//
//  Pomodoro.swift
//  Pomodoro
//
//  Created by zac on 2021/08/22.
//

import Foundation

struct Pomodoro {
    
    var studyTime: Int
    var breakTime: Int
    var totalTime: Int {
        return studyTime + breakTime
    }
    
    var pomodoros: Int {
        return Int(totalTime / 30)
    }
        
    func showResult() -> DailyResult {
        if pomodoros >= 20 {
            return .phenomenal
        } else if pomodoros >= 16 {
            return .verygood
        } else if pomodoros >= 10 {
            return .good
        } else if pomodoros >= 6 {
            return .bad
        } else if pomodoros >= 2 {
            return .verybad
        } else {
            return .terrible
        }
    }
    
}



