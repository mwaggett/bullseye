//
//  ViewController.swift
//  BullsEye
//
//  Created by Molly Waggett on 11/24/15.
//  Copyright © 2015 Molly Waggett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if (difference == 0) {
            title = "Perfect!"
            points += 100
        } else if (difference <= 5) {
            title = "You almost had it!"
            if (difference == 1) {
                points += 50
            }
        } else if (difference <= 10) {
            title = "Pretty good!"
        } else if (difference <= 30) {
            title = "Not bad."
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points!"
        
        let alert = UIAlertController(title: title,
                                    message: message,
                                    preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default,
                                    handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        score += points
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round++
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

