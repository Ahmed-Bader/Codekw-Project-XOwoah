//
//  Board.swift
//  XO-Woah
//
//  Created by Ahmed Alkhuder on 11/1/21.
//

import Foundation


struct Board: Identifiable {
    let size : Size  //for the size of the game board (which is going to be 3x3, 4x4, 5x5)
    let mark : String //for the mark that is printed on the button when it is clicked
    let marked : Bool // to enable/disable blocks(buttons) after restarting the game or being tapped respectively
    
    let id = UUID()
}

enum Size {
    case two, three, four
}
