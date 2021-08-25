//
//  MainViewController.swift
//  Pomodoro
//
//  Created by zac on 2021/08/19.
//

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var guideImageView: UIImageView!
    @IBOutlet private weak var pomodoroLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var studyButton: UIButton!
    @IBOutlet private weak var breakButton: UIButton!
    @IBOutlet private weak var endButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
 
    private var pomodoroEmoji = ""
}

extension MainViewController {
    enum Mode {
        case standby
        case counting(count: Int)
        case result
    }
}

extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        update(mode: .standby)
    }
}

extension MainViewController {
    private func addPomodoro() {
        dailyPomodoro.pomodoroBasket += ["🍅"]
    }

    private func addPomodoroToScreen() {
        addPomodoro()
        pomodoroEmoji += "🍅"
        update(mode: .counting(count: 1))
    }
}

extension MainViewController {
    private func update(mode: Mode) {
        switch mode {
        case .standby:
            studyButton.isEnabled = true
            breakButton.isEnabled = true
            endButton.isEnabled = true
            
            timeLabel.isHidden = true
            
            view.backgroundColor = .systemOrange
            
            pomodoroLabel.font = .systemFont(ofSize: 10)
            pomodoroLabel.text = pomodoroEmoji
            
            let image = UIImage(named: "pomodoro")
            guideImageView.image = image
        case .counting(let count):
            studyButton.isEnabled = true
            breakButton.isEnabled = true
            endButton.isEnabled = true
            
            timeLabel.isHidden = true
            
            view.backgroundColor = .systemOrange
            
            pomodoroLabel.font = .systemFont(ofSize: 10)
            pomodoroLabel.text = pomodoroEmoji
            
            let image = UIImage(named: "pomodoro")
            guideImageView.image = image
        case .result:
            studyButton.isEnabled = false
            breakButton.isEnabled = false
            endButton.isEnabled = false
            
            timeLabel.isHidden = false
            timeLabel.text = "StudyTime: \(dailyPomodoro.studyTime)mins BreakTime: \(dailyPomodoro.breakTime)mins"
            
            view.backgroundColor = UIColor.cyan
            
            let image = UIImage(named: "sea")
            guideImageView.image = image
            
            pomodoroLabel.font = UIFont.systemFont(ofSize: 20)
            pomodoroLabel.text = dailyPomodoro.showResult().message
        }
    }
}

extension MainViewController {
    @IBAction private func tapStudyButton(_ sender: UIButton) {
        dailyPomodoro.studyTime += 25
        addPomodoroToScreen()
    }
    
    @IBAction private func tapBreakButton(_ sender: UIButton) {
        dailyPomodoro.breakTime += 5
    }

    @IBAction private func tapEndButton(_ sender: UIButton) {
         update(mode: .result)
    }
    
    @IBAction private func tapResetButton(_ sender: UIButton) {
        dailyPomodoro.studyTime = 0
        dailyPomodoro.breakTime = 0
        dailyPomodoro.pomodoroBasket = []
        pomodoroEmoji = ""
        update(mode: .standby)
    }
}
