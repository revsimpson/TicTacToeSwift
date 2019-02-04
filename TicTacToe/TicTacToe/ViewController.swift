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
    
    var crossInputs : [Int] = []
    var circleInputs : [Int] = []
    var circleTurn : Bool = true
    var activeButtons : [UIButton] = []
    
    enum Player {
        case cross(playerInput:[Int])
        case circle(playerInput:[Int])
        
        func isWinner()-> Bool {
            var input : [Int] = []
            switch self {
            case .circle(let playerInput):
                input = playerInput
            case .cross(let playerInput):
                input = playerInput
            }
            
            let paths : [Int:[Int]] = [1:[0,3,],2:[2],3:[0,1,2],4:[0]]
            var isWinner = false
            input.forEach{
                for index in 1...4 {
                    if input.contains($0 + index), input.contains($0 + (index * 2)) , (paths[index]?.contains(input.sorted().first!))! {
                        isWinner = true
                    }
                }
            }
            return isWinner
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ButtonClicked(_ sender: UIButton) {
        activeButtons.append(sender)
        addInput(sender: sender)
    }
    
    func addInput(sender:UIButton){
        
        if  circleTurn  {
            circleInputs.append(sender.tag)
            sender.setBackgroundImage(UIImage(named: "circle"), for: .normal)
            circleTurn.toggle()
            Player.circle(playerInput: circleInputs).isWinner() ? (resultLabel.text = "Circle has won") : (resultLabel.text = "Cross turn")
            
        } else {
            crossInputs.append(sender.tag)
            sender.setBackgroundImage(UIImage(named: "cross"), for: .normal)
            circleTurn.toggle()
            Player.cross(playerInput: crossInputs).isWinner() ? (resultLabel.text = "Cross has won") : (resultLabel.text = "Circle turn")
        }
        
        sender.isEnabled = false
    }
    
    @IBAction func restartClicked(_ sender: Any) {
        crossInputs  = []
        circleInputs  = []
        circleTurn = true
        activeButtons.forEach{
            $0.setBackgroundImage(UIImage(), for: .normal)
            $0.isEnabled = true
            resultLabel.text = "Begin game"
        }
        activeButtons = []
    }
}

