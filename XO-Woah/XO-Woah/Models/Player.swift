//
//  Player.swift
//  XO-Woah
//
//  Created by Ahmed Alkhuder on 11/1/21.
//

import SwiftUI

struct Player: Identifiable {
    let playerTurn : PlayerTurn
    
    let id = UUID()
}

enum PlayerTurn {
    case first, second, third, fourth, fifth
}
