//
//  ViewController.swift
//  RPS
//
//  Created by Кирилл Шишкин on 10.07.2020.
//  Copyright © 2020 Кирилл Шишкин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var dropResultsButton: UIButton!
    var robotResults = 0
    var playerResults = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isHidden = true
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        resetButton.isHidden = false
        
        let result = sign.getResult(computerSign)
        switch result {
        case .win:
            statusLabel.text = "WIN"
            self.view.backgroundColor = UIColor.green
            playerResults += 1
            resultsLabel.text = "\(robotResults) : \(playerResults)"
        case .lose:
            statusLabel.text = "LOSE"
            self.view.backgroundColor = UIColor.red
            robotResults += 1
            resultsLabel.text = "\(robotResults) : \(playerResults)"
        case .start:
            reset()
        case .draw:
            statusLabel.text = "DRAW"
            self.view.backgroundColor = UIColor.gray
        }
    }
    
    func reset() {
        statusLabel.text = "Rock, Paper, Scissors?"
        self.view.backgroundColor = UIColor.white
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = false
    }
    
    func dropResult() {
        resultsLabel.text = "0 : 0"
        robotResults = 0
        playerResults = 0
    }
    // MARK: - IBAction
    
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        play(.rock)
    }
    
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        play(.paper)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        play(.scissors)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
    @IBAction func dropButton(_ sender: UIButton) {
        dropResult()
    }
}

