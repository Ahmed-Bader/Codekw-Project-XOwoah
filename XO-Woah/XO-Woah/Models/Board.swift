//
//  Board.swift
//  XO-Woah
//
//  Created by Ahmed Alkhuder on 11/1/21.
//

import Foundation


struct Board: Identifiable {
    let size : Int  //for the size of the game board (which is going to be 3x3, 4x4, 5x5)
    let playerMark : [String]
    let drawcounter: Int // for the draw
    
    let id = UUID()
}

/*var sizes = [
    Board(size: 3, drawcounter: 9),
    Board(size: 4, drawcounter: 16),
    Board(size: 5, drawcounter: 25)
]*/

//players: X O 🤨 🥸

//what is supposed to happen is that content view sends the board that contains size,drawcount and players to the game(size: ,playermark: PT[],drawcounter: )
//then the game takes those values and uses them to defin the size of the game, the drawcounter and swith statement with the mark of each player.
