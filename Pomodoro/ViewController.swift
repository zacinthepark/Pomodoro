//
//  ViewController.swift
//  Pomodoro
//
//  Created by zac on 2021/08/19.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var guideImageView: UIImageView!
    @IBOutlet private weak var pomodoroLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var studyButton: UIButton!
    @IBOutlet private weak var breakButton: UIButton!
    @IBOutlet private weak var endButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
 
    private var dailyPomodoro = Pomodoro(studyTime: 0, breakTime: 0)
    private var pomodoroEmoji = ""
    
}


extension ViewController {
    
    private func updateScreen() {
        let image = UIImage(named: "pomodoro")
        guideImageView.image = image
        
        var pomodoroCount = dailyPomodoro.pomodoros
        while pomodoroCount > 0 {
            pomodoroEmoji += "🍅"
            pomodoroCount = pomodoroCount - 1
        }
        pomodoroLabel.text = pomodoroEmoji
        
        timeLabel.isHidden = true
    }
}

extension ViewController {
    
    private func endCounting() {
        studyButton.isEnabled = false
        breakButton.isEnabled = false
        timeLabel.isHidden = false
        timeLabel.text = "Daily Total: Studied \(dailyPomodoro.studyTime)mins with \(dailyPomodoro.breakTime)mins of break"
    }
    
}

extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController {
    
    @IBAction private func tapStudyButton(_ sender: UIButton) {
        dailyPomodoro.studyTime += 25
    }
    
}

extension ViewController {
    
    @IBAction private func tapBreakButton(_ sender: UIButton) {
        dailyPomodoro.breakTime += 5
    }
    
}

extension ViewController {
    
    @IBAction private func tapEndButton(_ sender: UIButton) {
    }
    
}


