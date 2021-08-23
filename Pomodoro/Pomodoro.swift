//
//  Pomodoro.swift
//  Pomodoro
//
//  Created by zac on 2021/08/22.
//

import Foundation

struct Pomodoro {
    
    var pomodoroBasket = [String]()
    
    var studyTime: Int
    var breakTime: Int
        
    func showResult() -> DailyResult {
        if pomodoroBasket.count >= 20 {
            return .phenomenal
        } else if pomodoroBasket.count >= 16 {
            return .verygood
        } else if pomodoroBasket.count >= 10 {
            return .good
        } else if pomodoroBasket.count >= 6 {
            return .bad
        } else if pomodoroBasket.count >= 2 {
            return .verybad
        } else {
            return .terrible
        }
    }
    
}



