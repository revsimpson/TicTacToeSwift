//
//  Player.swift
//  TicTacToe
//
//  Created by Richard EV Simpson on 05/02/2019.
//  Copyright © 2019 REVS. All rights reserved.
//

import Foundation

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
        
        return GameEngine.checkForWinner(playerInput: input)
      
    }
}
