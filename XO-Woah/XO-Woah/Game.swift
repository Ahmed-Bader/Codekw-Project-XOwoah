//
//  Game.swift
//  XO-Woah
//
//  Created by Eng.Ahmed Bader on 13/01/2021.
//

import SwiftUI

struct Game: View {
    let size : Int //size of game board in terms of rows and columns (3,4or5)
    let drawLimit : Int // max number of turns ( = number of cells )
    @State var playerTurn = PlayerTurn.one
    @State var p = ""
    @State var fields : [[Field]] = .init(repeating: .init(repeating: Field(player: "", enabled: true), count: 5 ), count: 5)
    @State var drawCounter = 0
    @State var winner = ""
    @State var winStatus = false
    var body: some View {
        
        VStack {
            //so who's turn is it?
            Text(whoPlays(s: size))
                .font(.largeTitle)
            
            /*  switch playerTurn {
             case .one:
             Text("X's turn!")
             .font(.largeTitle)
             case .two:
             Text("O's turn!")
             .font(.largeTitle)
             case .three:
             Text("🤓's turn!")
             .font(.largeTitle)
             case .four:
             Text("🥸's turn!")
             .font(.largeTitle)
             }*/
            VStack(spacing: 10){
                ForEach(0..<size){ r in
                    HStack(spacing: 10){
                        ForEach(0..<size){ c in
                            Button(action:
                                    {
                                        if fields [r][c].enabled
                                        {
                                            //fields[r][c].player = playerTurn
                                            switch playerTurn {
                                            case .one:
                                                fields[r][c].player = "X"
                                                p = fields[r][c].player
                                            case .two:
                                                fields[r][c].player = "O"
                                                p = fields[r][c].player
                                            case .three:
                                                fields[r][c].player = "🤓"
                                                p = fields[r][c].player
                                            case .four:
                                                fields[r][c].player = "🥸"
                                                p = fields[r][c].player
                                            }
                                            drawCounter += 1
                                            checkWinner()
                                            if winStatus == false
                                            {
                                                //this needs to change for multi
                                                //playerTurn = playerTurn == "X" ? "O" : "X"
                                                switch playerTurn {
                                                case .one:
                                                    p = "O"
                                                    playerTurn = .two
                                                case .two:
                                                    p = "🤓"
                                                    playerTurn = .three
                                                case .three:
                                                    p = "🥸"
                                                    playerTurn = .four
                                                case .four:
                                                    p = "X"
                                                    playerTurn = .one
                                                }
                                                fields[r][c].enabled = false
                                            }else{
                                                endGame()
                                            }
                                            
                                        }
                                    },label:
                                        {
                                            Text(fields[r][c].player)
                                                .font(.system(size: 60))
                                                .foregroundColor(.black)
                                                .frame(width: 70, height: 70, alignment: .center)
                                                .background(Color.white)
                                        })
                        }
                    }
                }
            }.background(Color.gray) // if i put it black YOU WON'T SEE THE TEXT!
            .padding()
            
            if winner != "" {
                Text(winner)
                    .font(.largeTitle)
                Button(action: { restartG() },
                       label:{
                        Text("Play Again?")
                            .font(.largeTitle)
                            .frame(width: 200, height: 70, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                       }).padding()
            }else{
                Button(action: { restartG() },
                       label:{
                        Text("Reset")
                            .font(.largeTitle)
                            .frame(width: 200, height: 70, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                       }).padding()
            }
        }.background(Color.yellow)
        .alert(isPresented: $winStatus, content: {
            Alert(title: Text(winner))
        })
        
    }
    
    // INCOMING FUNCTIONS!!-----------------------------
    func whoPlays(s: Int) -> String {
        if s == 3 {
            switch playerTurn {
            case .one:
                return "X's turn!"
            case .two:
                return "O's turn!"
            default:
                print("something is wrong with who plays size 3")
            }
        } else if s == 4 {
            switch playerTurn {
            case .one:
                return "X's turn!"
            case .two:
                return "O's turn!"
            case .three:
                return "🤓's turn!"
            default:
                print("something is wrong with who plays size 4")
            }
        } else if s == 5 {
            switch playerTurn {
            case .one:
                return "X's turn!"
            case .two:
                return "O's turn!"
            case .three:
                return "🤓's turn!"
            case .four:
                return "🥸's turn!"
            }
        }
        return "how did u even get here?"
    }
    
    func whoMarks(s: Int,i: Int,j: Int){
        if s == 3 {
            
        } else if s == 4 {
            
        } else if s == 5 {
            
        }
    }
    
    func playerSwitcher(s: Int,i: Int,j: Int){
        if s == 3 {
            
        } else if s == 4 {
            
        } else if s == 5 {
            
        }
    }
    
    func checkWinner()
    {
        var rowCheck, colCheck : Bool // to check rows and column wins
        //loop for rows and columns
        for i in 0..<size {
            rowCheck = true
            colCheck = true
            /*looping the true value for row and col to make sure that in case of last column
             on the right wins when it is marked first, otherwise it will not count the win for the right side column
             we're also contiously checking from left to right.*/
            for j in 0..<size {
                rowCheck = rowCheck && fields[i][j].player == p
                colCheck = colCheck && fields[j][i].player == p
            }
            if rowCheck || colCheck {
                winner = ("\(p) is the winner!")
                winStatus = true
            }
        }
        
        var d1 = true
        //loop for first diagonal left->right
        for i in (0..<size) {
            d1 = d1 && fields[i][i].player == p
        }
        
        /* let d1 = fields[0][0].player == playerTurn
         && fields[1][1].player == playerTurn
         && fields[2][2].player == playerTurn
         && fields[3][3].player == playerTurn
         && fields[4][4].player == playerTurn*/
        
        //checking the second diagonal right->left
        var d2 = true
        switch size {
        case 3:
            d2 = fields[0][2].player == p
                && fields[1][1].player == p
                && fields[2][0].player == p
        case 4:
            d2 = fields[0][3].player == p
                && fields[1][2].player == p
                && fields[2][1].player == p
                && fields[3][0].player == p
        case 5:
            d2 = fields[0][4].player == p
                && fields[1][3].player == p
                && fields[2][2].player == p
                && fields[3][1].player == p
                && fields[4][0].player == p
        default:
            print("d2 didn't work!")
            d2 = false
        }
        
        if d1 || d2 {
            winner = ("\(p) is the winner!")
            winStatus = true
        } else if drawCounter == drawLimit {
            winner = "Draw :("
            winStatus = true
        }
    }
    
    // loop to disable all boxes and end game
    func endGame() {
        for i in 0..<size {
            for j in 0..<size {
                fields[i][j].enabled = false
            }
        }
    }
    
    func restartG()
    {
        fields = .init(repeating: .init(repeating: Field(player: "", enabled: true), count: size ), count: size)
        playerTurn = PlayerTurn.one
        p = ""
        winner = ""
        // the alert takes care of bool winstatus, if something goes wrong, remove comment winStatus = false
        drawCounter = 0
    }
}

struct Field {
    var player : String // player name/identification
    var enabled : Bool  // to check if box not used
}

enum PlayerTurn {
    case one,two,three,four
}


struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game(size: 3, drawLimit: 9)
    }
}


// size should be 120, 100, 70 for block frames

/* here lies the notes,failed tests and code snippets of my dark depressing trials at making the code quality better...
 check each row [0][c] [1][c] [2][c]
 var row = Array(repeating: false, count: 2)
 var rowcheck = false
 
 //i want to use row in a foreach but i don't quite understand how it works just yet.
 //for k in 0..<3{ // loop for each row
 
 for i in 0..<row.count { // loop to check current row
 for cell in 0..<3 { //loop to take boolean values of each cell
 row [i] = fields[0][cell].player == playerTurn
 }
 }
 rowcheck = row.allSatisfy({$0 == true})
 if rowcheck == true {
 winner = ("\(playerTurn) is the winner!")
 winStatus = true
 //  break
 }else if drawCounter == 9 {
 winner = "Draw :("
 winStatus = true
 //  break
 }
 //}
 each checks the boolean value of the blocks in that row/column/diagonal
 player == playerTurn means if they are matching to tell if that row/column/diagonal
 is occupied by the same player making them the winner
 let r1 = fields[0][0].player == playerTurn && fields[0][1].player == playerTurn && fields[0][2].player == playerTurn
 let r2 = fields[1][0].player == playerTurn && fields[1][1].player == playerTurn && fields[1][2].player == playerTurn
 let r3 = fields[2][0].player == playerTurn && fields[2][1].player == playerTurn && fields[2][2].player == playerTurn
 
 check each column [r][0] [r][1] [r][2]
 let c1 = fields[0][0].player == playerTurn && fields[1][0].player == playerTurn && fields[2][0].player == playerTurn
 let c2 = fields[0][1].player == playerTurn && fields[1][1].player == playerTurn && fields[2][1].player == playerTurn
 let c3 = fields[0][2].player == playerTurn && fields[1][2].player == playerTurn && fields[2][2].player == playerTurn
 
 check both diagonals (0,0 - 1,1 - 2,2) (0,2 - 1,1 - 2,0)
 let d1 = fields[0][0].player == playerTurn && fields[1][1].player == playerTurn && fields[2][2].player == playerTurn
 let d2 = fields[0][2].player == playerTurn && fields[1][1].player == playerTurn && fields[2][0].player == playerTurn
 
 can be done in  loop but... trial and error ,which loop, forEach? for? while? WHICH ONE?!?!?! THE NUMBERS MASON!
 nested for each loops use ij for rows, then ji for columns, use boolean value to define the true false
 
 if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
 winner = ("\(playerTurn) is the winner!")
 winStatus = true
 }else if drawCounter == 9 {
 winner = "Draw :("
 winStatus = true
 }
 */
