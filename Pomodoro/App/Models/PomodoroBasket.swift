//
//  PomodoroCounter.swift
//  PomodoroCounter
//
//  Created by zac on 2021/08/22.
//

import Foundation

struct PomodoroBasket {
    private var pomodoros: Int = .zero
    private var breaks: Int = .zero
}

extension PomodoroBasket {
    private var unitStudyTime: Int {
        25
    }
    
    private var unitBreakTime: Int {
        5
    }
        
    private var studyTime: Int {
        pomodoros * unitStudyTime
    }
    
    private var breakTime: Int {
        breaks * unitBreakTime
    }
}

extension PomodoroBasket {
    var emojis: String {
        String(repeating: "🍅", count: pomodoros)
    }
    
    var timeLabelText: String {
        "StudyTime: \(studyTime)mins BreakTime: \(breakTime)mins"
    }
}

extension PomodoroBasket {
    mutating func addPomodoro() {
        pomodoros += 1
    }
    
    mutating func addBreakTime() {
        breaks += 1
    }
    
    mutating func resetBasket() {
        pomodoros = .zero
        breaks = .zero
    }
}

extension PomodoroBasket {
    var dailyResultMessage: String {
        DailyResult(pomodoros: pomodoros).message
    }
}
