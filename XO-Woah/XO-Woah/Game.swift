//
//  Game.swift
//  XO-Woah
//
//  Created by Eng.Ahmed Bader on 13/01/2021.
//

import SwiftUI

struct Game: View {
    /*here we're supposed to receive 3 things:
     1- size of game
     2- mark of each player
     3- drawcount.
     i don't think i need a board swift file and enums for this.. i need to ask.*/
    @State var fields : [[Field]] = .init(repeating: .init(repeating: Field(player: "", enabled: true), count: 5 ), count: 5)
    // i think this has some thing to do with creating the blocks for X O
    /* there is another way of typing the above, check recording
     @State var fields : [[Field]]((repeating: Field(player: "", enabled: true),count: 3),
     [Field] (repeating: Field(player: "", enabled: true), count: 3))
     */
    @State var playerTurn = "X" //might need to make an array with marks for the table
    @State var drawCounter = 0
        //create constant that equals incoming max draw count.
    @State var winner = ""
    @State var winStatus = false
    
    var body: some View {
        VStack(spacing: 10){
            
            Text("\(playerTurn)'s turn!")
                .font(.largeTitle)
            
            ForEach(0..<5){ r in
                HStack(spacing: 10){
                    ForEach(0..<5){ c in
                        Button(action:
                                {
                                    if fields [r][c].enabled
                                    {
                                        fields[r][c].player = playerTurn
                                        drawCounter += 1
                                        checkWinner()
                                        if winStatus == false
                                        {
                                            //this needs to change for multi
                                            playerTurn = playerTurn == "X" ? "O" : "X"
                                            
                                            /*ternary operator is just like an if statement
                                             it basically means if playerturn == X put O
                                             else put X*/
                                            
                                            fields[r][c].enabled = false
                                        }
                                        else
                                        {
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
            if winner != "" {
                Text(winner)
                Button(action: { restartG() },
                       label:{
                        Text("Play Again?")
                            .font(.largeTitle)
                            .frame(width: 300, height: 70, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                       }).padding()
            }
        }.background(Color.gray) // if i put it black YOU WON'T SEE THE TEXT!
    }
    
    //we put the function inside the scope of view
    //because we need to check the variables that we created here
    // once we go out of the scope, r and c don't exist anymore unless they are sent as arguements
    
    func checkWinner()
    {
        var rowCheck, colCheck : Bool // to check rows and column wins
        // need to change the size of loops according to game size.
        for i in 0..<5 {
            rowCheck = true
            colCheck = true
            /*looping the true value for row and col to make sure that in case of last column
             on the right wins when it is marked first, otherwise it will not count the win for the right side column
             we're also contiously checking from left to right.*/
            for j in 0..<5 {
                rowCheck = rowCheck && fields[i][j].player == playerTurn
                colCheck = colCheck && fields[j][i].player == playerTurn
            }
            if rowCheck || colCheck {
                winner = ("\(playerTurn) is the winner!")
                winStatus = true
            }
        }
        
        var d1 = true
        //loop for first diagonal left->right
        for i in (0..<5) {
                d1 = d1 && fields[i][i].player == playerTurn
        }
        
       /* let d1 = fields[0][0].player == playerTurn
            && fields[1][1].player == playerTurn
            && fields[2][2].player == playerTurn
            && fields[3][3].player == playerTurn
            && fields[4][4].player == playerTurn*/
        
        let d2 = fields[0][4].player == playerTurn
            && fields[1][3].player == playerTurn
            && fields[2][2].player == playerTurn
            && fields[3][1].player == playerTurn
            && fields[4][0].player == playerTurn
        
        if d1 || d2 {
            winner = ("\(playerTurn) is the winner!")
            winStatus = true
        }
    }
    
    
    // loop to disable all boxes and end game
    func endGame() {
        for i in 0..<5 {
            for j in 0..<5 {
                fields[i][j].enabled = false
            }
        }
    }
    
    func restartG()
    {
        fields = .init(repeating: .init(repeating: Field(player: "", enabled: true), count: 5 ), count: 5)
        playerTurn = "X"
        winner = ""
        winStatus = false
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
        Game()
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
