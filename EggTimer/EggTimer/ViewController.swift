//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    
    var player: AVAudioPlayer!
    
    var secondsRemaining = 0
    var counter = 0
    
    let eggTimes = [
        "Soft": 5,
        "Medium": 8,
        "Hard": 12
    ]
    
    override func viewDidLoad() {
        progressBar.progress = 0.0
        loadSound()
    }
    
    func loadSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        clear()
        
        let hardness = sender.currentTitle!
        myLabel.text = hardness
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc func countDown() {
        if counter <= secondsRemaining {
            let progressValue = Float(counter) / Float(secondsRemaining)
            print(progressValue)
            progressBar.progress = progressValue
            counter += 1
        } else {
            myLabel.text = "DONE!"
            playSound()
            clear()
        }
    }
    
    func clear() {
        counter = 1
        progressBar.progress = 0.0
        timer.invalidate()
    }

    
    func playSound() {
        player.play()
    }
}
