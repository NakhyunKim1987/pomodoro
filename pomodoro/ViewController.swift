//
//  ViewController.swift
//  pomodoro
//
//  Created by NakHyun Kim on 2022/06/22.
//

import UIKit


enum TimerStatus{
    case start
    case pause
    case end
}

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    
    var duration =  60
    var timerStatus: TimerStatus = .end
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
    }
    
    func configureToggleButton(){
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정지", for: .selected)
    }
    
    func setTimerInfoViewVisble(isHidden: Bool){
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }

    @IBAction func tapCancelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
            self.timerStatus = .end
            self.cancelButton.isEnabled = false
            self.setTimerInfoViewVisble(isHidden: true)
            self.datePicker.isHidden = false
            self.toggleButton.isSelected = false
        default:
            break
        }
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration)
        switch self.timerStatus {
        case .end:
            self.timerStatus = .start
            self.setTimerInfoViewVisble(isHidden: false)
            self.datePicker.isHidden = true
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true
        
        }
    }
    
}

