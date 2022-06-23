//
//  ViewController.swift
//  Egg Timer
//
//  Created by Abai Kush on 21/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var fourMinButton: UIButton!
    @IBOutlet weak var sixMinButton: UIButton!
    @IBOutlet weak var eightMinButton: UIButton!
    
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var minutesTimer: UILabel!
    @IBOutlet weak var secondsTimer: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    @IBOutlet weak var slider: UISlider!
    
    var eggsCondition: String = "None"
    var seconds: String = "00"
    var minutes: String = "00"
    
    var counterSeconds: Int = 0
    var counterMinutes: Int = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minutesTimer.text = minutes
        secondsTimer.text = seconds
        
        type.text = eggsCondition //состояние готовности яйца
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(makeStepBack), userInfo: nil, repeats: true)
        print("Play")
    }
    
    @IBAction func fourMinTapped(_ sender: UIButton) {
        
        print("Raw")
        timer.invalidate()
        resetAll()
        
        eggsCondition = "Raw"
        counterSeconds = 05
        counterMinutes = 3
        slider.value = Float(counterMinutes)
        
        type.text = eggsCondition
        minutesTimer.text = "\(counterMinutes)"
        secondsTimer.text = "\(counterSeconds)"
    }
    
    @IBAction func sixMinTapped(_ sender: UIButton) {
        
        print("middle")
        timer.invalidate()
        resetAll()
        
        eggsCondition = "Middle"
        counterSeconds = 59
        counterMinutes = 5
        slider.value = Float(counterMinutes)
        
        type.text = eggsCondition
        minutesTimer.text = "\(counterMinutes)"
        secondsTimer.text = "\(counterSeconds)"
        
    }
    
    @IBAction func eightMinTapped(_ sender: UIButton) {
        print("Fried")
        timer.invalidate()
        resetAll()
        eggsCondition = "Fried"
        counterSeconds = 4
        counterMinutes = 7
        slider.value = Float(counterMinutes)
        
        type.text = eggsCondition
        minutesTimer.text = "\(counterMinutes)"
        secondsTimer.text = "\(counterSeconds)"
    }
    
    @objc func makeStepBack(){
        slider.value = Float(counterMinutes)
        if counterMinutes != 0{
            
            if counterSeconds != 0 {
                counterSeconds -= 1
                
                if counterSeconds < 10{
                    secondsTimer.text = "0\(counterSeconds)"
                }else{
                    secondsTimer.text = "\(counterSeconds)"
                }
            }else{
                counterSeconds = 60
                counterMinutes -= 1
                minutesTimer.text = "\(counterMinutes)"
                slider.value = Float(counterMinutes)
            }
        }else{
            timer.invalidate()
            resetAll()
        }
    }
    
    func resetAll(){
        eggsCondition = "None"
        seconds = "00"
        minutes = "00"
    }
}
