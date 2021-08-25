//
//  AccomplishmentLevel.swift
//  Pomodoro
//
//  Created by zac on 2021/08/25.
//

import Foundation

enum AccomplishmentLevel {
    case phenomenal, verygood, good, bad, verybad, terrible
    
    init(pomodoros: Int) {
        if pomodoros >= 20 {
            self = .phenomenal
        } else if pomodoros >= 16 {
            self = .verygood
        } else if pomodoros >= 10 {
            self = .good
        } else if pomodoros >= 6 {
            self = .bad
        } else if pomodoros >= 2 {
            self = .verybad
        } else {
            self = .terrible
        }
    }
}
