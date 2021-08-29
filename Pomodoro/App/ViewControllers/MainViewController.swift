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
        case counting
        case result
    }
}

extension MainViewController.Mode {
    var backgroundColor: UIColor {
        switch self {
        case .standby, .counting:
            return .green
        case .result:
            return .red
        }
    }
    
    var guideImage: UIImage? {
        switch self {
        case .standby, .counting:
            return UIImage(named: "pomodoro")
        case .result:
            return UIImage(named: "pomodoro")
        }
    }
    
    var pomodoroLabelFont: UIFont {
        switch self {
        case .standby, .counting:
            return .systemFont(ofSize: 10)
        case .result:
            return .systemFont(ofSize: 20)
        }
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
            enableCounting(isEnabled: true)
            configureTimeLabel(timeText: nil)
            pomodoroLabel.text = ""
        case .counting:
            enableCounting(isEnabled: true)
            configureTimeLabel(timeText: nil)
            pomodoroLabel.text = pomodoroBasket.emojis
        case .result:
            enableCounting(isEnabled: true)
            configureTimeLabel(timeText: pomodoroBasket.timeLabelText)
            pomodoroLabel.text = pomodoroBasket.dailyResultMessage
        }
        
        view.backgroundColor = mode.backgroundColor
        guideImageView.image = mode.guideImage
        pomodoroLabel.font = mode.pomodoroLabelFont
    }
    
    private func enableCounting(isEnabled: Bool) {
        studyButton.isEnabled = isEnabled
        breakButton.isEnabled = isEnabled
        endButton.isEnabled = isEnabled
    }
    
    private func configureTimeLabel(timeText: String?) {
        timeLabel.isHidden = timeText == nil
        timeLabel.text = timeText
    }
}

extension MainViewController {
    private func addPomodoro() {
        pomodoroBasket.addPomodoro()
        update(mode: .counting)
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
