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
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    
    var player: AVAudioPlayer?
    
    @IBAction func eggButton(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed <= totalTime {
            
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            print (Float(secondsPassed) / Float(totalTime))
            
            
            
            
            
            print("\(secondsPassed) seconds to the end of the world")
            secondsPassed += 1
        }
        else{
            timer.invalidate()
            titleLabel.text = "Eggs Done!!!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        
        guard let player = player else { return }
        
        player.play()
        
        
    }
    
}
