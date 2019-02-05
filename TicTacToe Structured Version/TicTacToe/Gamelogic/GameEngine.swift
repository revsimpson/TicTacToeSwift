//
//  GameEngine.swift
//  TicTacToe
//
//  Created by Richard EV Simpson on 05/02/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation
import UIKit

struct GameEngine {
    
    var crossInputs : [Int] = []
    var circleInputs : [Int] = []
    var circleTurn : Bool = true
    var activeButtons : [UIButton] = []
    
    static func checkForWinner(playerInput:[Int]) -> Bool {
        
        let paths : [Int:[Int]] = [1:[0,3,],2:[2],3:[0,1,2],4:[0]]
        var isWinner = false
        
        playerInput.forEach{
            
            for index in 1...4 {
                if playerInput.contains($0 + index), playerInput.contains($0 + (index * 2)) , (paths[index]?.contains(playerInput.sorted().first!))! {
                    isWinner = true
                    
                }
            }
        }
        
        return isWinner
    }
    
    mutating func getStatusResultText(sender:UIButton)-> String {
        
        sender.isEnabled = false
        
        if  circleTurn  {
            circleInputs.append(sender.tag)
            sender.setBackgroundImage(UIImage(named: "circle"), for: .normal)
            circleTurn.toggle()
            return Player.circle(playerInput: circleInputs).isWinner() ?  "Circle has won" : "Cross turn"
            
        } else {
            crossInputs.append(sender.tag)
            sender.setBackgroundImage(UIImage(named: "cross"), for: .normal)
            circleTurn.toggle()
            return Player.cross(playerInput: crossInputs).isWinner() ?   "Cross has won" : "Circle turn"
        }
    
    }
    
    mutating func reset() {
        
        crossInputs  = []
        circleInputs  = []
        circleTurn = true
        activeButtons.forEach{
            $0.setBackgroundImage(UIImage(), for: .normal)
            $0.isEnabled = true
        }
        activeButtons = []
        
    }
    
}
