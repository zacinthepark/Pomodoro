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
    
    var pomodoros: Int {
        let totalTime = studyTime + breakTime
        return totalTime / 30
    }
        
    func showResult() -> DailyResult {
        if self.pomodoros >= 20 {
            return .phenomenal
        } else if self.pomodoros >= 16 {
            return .verygood
        } else if self.pomodoros >= 10 {
            return .good
        } else if self.pomodoros >= 6 {
            return .bad
        } else if self.pomodoros >= 2 {
            return .verybad
        } else {
            return .terrible
        }
    }
    
}



