//
//  ViewController.swift
//  trafficLightGame
//
//  Created by prasanna karki on 6/1/18.
//  Copyright © 2018 PKStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var trafficImage: UIImageView!
    @IBOutlet var startStopButton: UIButton!
    
    var startTimer = Timer()
    var scoreTimer = Timer()
    
    var timeInt = 0
    var scoreInt = 0
    
    @IBOutlet var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func StartGame(_ sender: Any) {
        
        if scoreInt == 0 {
            
            timeInt = 3
            
            trafficImage.image = UIImage(named: "trafficLight")
            
            startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            scoreLabel.text = String(scoreInt)
            
            startStopButton.isEnabled = false
            
            startStopButton.setTitle("", for: UIControl.State.normal)
            
        }
        else {
            scoreTimer.invalidate()
            scoreInt = 0
            
            startStopButton.setTitle("Restart", for: UIControl.State.normal)
        }
        
        
        
    }
    
    @objc func updateTimer(){
        
        timeInt -= 1
        
        if timeInt == 2 {
            trafficImage.image = UIImage(named: "trafficLight3")
            
        }
        
        else if timeInt == 1 {
            trafficImage.image = UIImage(named: "trafficLight2")
            
        }
        
        else if timeInt == 0 {
            trafficImage.image = UIImage(named: "trafficLight1")
            startTimer.invalidate()
            
            
            scoreTimer = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(updateScoreTimer), userInfo: nil, repeats: true)
            startStopButton.isEnabled = true
            startStopButton.setTitle("Stop", for: UIControl.State.normal)
        }
            
        }
    
    @objc func updateScoreTimer() {
        scoreInt += 1
        scoreLabel.text = String(scoreInt)
    }
        
    }

    


