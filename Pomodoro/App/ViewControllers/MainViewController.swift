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
    
    var pomodoroBasket = PomodoroBasket()
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
    private func update(mode: Mode) {
        switch mode {
        case .standby:
            studyButton.isEnabled = true
            breakButton.isEnabled = true
            endButton.isEnabled = true
            
            timeLabel.isHidden = true
            
            view.backgroundColor = .systemOrange
            
            pomodoroLabel.font = .systemFont(ofSize: 10)
            pomodoroLabel.text = ""
            
            let image = UIImage(named: "pomodoro")
            guideImageView.image = image
        case .counting(let count):
            studyButton.isEnabled = true
            breakButton.isEnabled = true
            endButton.isEnabled = true
            
            timeLabel.isHidden = true
            
            view.backgroundColor = .systemOrange
            
            pomodoroLabel.font = .systemFont(ofSize: 10)
            pomodoroLabel.text = pomodoroBasket.emojis
            
            let image = UIImage(named: "pomodoro")
            guideImageView.image = image
        case .result:
            studyButton.isEnabled = false
            breakButton.isEnabled = false
            endButton.isEnabled = false
            
            timeLabel.isHidden = false
            timeLabel.text = "StudyTime: \(pomodoroBasket.studyTime)mins BreakTime: \(pomodoroBasket.breakTime)mins"
            
            view.backgroundColor = UIColor.cyan
            
            let image = UIImage(named: "sea")
            guideImageView.image = image
            
            pomodoroLabel.font = UIFont.systemFont(ofSize: 20)
            pomodoroLabel.text = pomodoroBasket.dailyResultMessage
        }
    }
}

extension MainViewController {
    private func addPomodoro() {
        pomodoroBasket.addPomodoro()
        update(mode: .counting(count: 1))
    }
}

extension MainViewController {
    @IBAction private func tapStudyButton(_ sender: UIButton) {
        addPomodoro()
    }
    
    @IBAction private func tapBreakButton(_ sender: UIButton) {
        pomodoroBasket.addBreakTime()
    }
    
    @IBAction private func tapEndButton(_ sender: UIButton) {
        update(mode: .result)
    }
    
    @IBAction private func tapResetButton(_ sender: UIButton) {
        pomodoroBasket.resetBasket()
        update(mode: .standby)
    }
}
