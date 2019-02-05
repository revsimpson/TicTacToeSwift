//
//  ViewController.swift
//  TicTacToe
//
//  Created by Richard EV Simpson on 04/02/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    
    var engine = GameEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ButtonClicked(_ sender: UIButton) {
        engine.activeButtons.append(sender)
        resultLabel.text = engine.getStatusResultText(sender: sender)
    }
    
    @IBAction func restartClicked(_ sender: Any) {
        resultLabel.text = "Begin game"
        engine.reset()
    }
}

