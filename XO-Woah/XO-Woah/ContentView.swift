//
//  ContentView.swift
//  XO-Woah
//
//  Created by Eng.Ahmed Bader on 11/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var fields : [[Field]] = .init(repeating: .init(repeating: Field(player: "", enabled: true), count: 3 ), count: 3)
    // i think this has some thing to do with creating the blocks for X O
    /* there is another wa of typing the above, check recording
     @State var fields : [[Field]]((repeating: Field(player: "", enabled: true),count: 3),
     [Field] (repeating: Field(player: "", enabled: true), count: 3))
     */
    @State var playerTurn : String = "X" //we only need to define one player i guess for this example
    @State var drawCounter = 0
    @State var winner = ""
    @State var winStatus = false
    
    var body: some View {
        VStack(spacing: 10){
            Text("\(playerTurn)'s turn my brudda!")
                .font(.largeTitle)
            ForEach(0..<3){ r in //for each number we reach in the foreach loop we take that number and put it in  the var we use (r)
                HStack(spacing: 10){
                    ForEach(0..<3){ c in //for each number we reach in the foreach loop we take that number and put it in  the var we use (r)
                        Button(action:
                                {
                                    if fields [r][c].enabled
                                    {
                                        fields[r][c].player = playerTurn
                                        drawCounter += 1
                                        checkWinner()
                                        if winStatus == false
                                        {
                                            playerTurn = playerTurn == "X" ? "O" : "X" //ternary operator is just like an if statement
                                            //it basically means if X was used, put O.. otherwise Put X if playerturn == X put O
                                            //else put X
                                            fields[r][c].enabled = false
                                        }
                                        else
                                        { //can use loop here too, need to check the double loops exist or i need nested loops
                                            fields[0][0].enabled = false
                                            fields[0][1].enabled = false
                                            fields[0][2].enabled = false
                                            fields[1][0].enabled = false
                                            fields[1][1].enabled = false
                                            fields[1][2].enabled = false
                                            fields[2][0].enabled = false
                                            fields[2][1].enabled = false
                                            fields[2][2].enabled = false
                                        }
                                        
                                    }
                                },
                               label:
                                {
                                    Text(fields[r][c].player)
                                        .font(.system(size: 60))
                                        .foregroundColor(.black)
                                        .frame(width: 90, height: 90, alignment: .center)
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
                       }).padding()
            }
        }.background(Color.gray) // if i put it black U WON'T SEE THE TEXT!
    }
    
    //we put the function inside the scope of view because we need to check the variables that we created here
    // once we go out of the scope, r and c don't exist anymore unless they are sent as arguements
    func checkWinner()
    {
        // check each row [0][c] [1][c] [2][c]
        let r1 = fields[0][0].player == playerTurn && fields[0][1].player == playerTurn && fields[0][2].player == playerTurn
        let r2 = fields[1][0].player == playerTurn && fields[1][1].player == playerTurn && fields[1][2].player == playerTurn
        let r3 = fields[2][0].player == playerTurn && fields[2][1].player == playerTurn && fields[2][2].player == playerTurn
        
        //[ check each column [r][0] [r][1] [r][2]
        let c1 = fields[0][0].player == playerTurn && fields[1][0].player == playerTurn && fields[2][0].player == playerTurn
        let c2 = fields[0][1].player == playerTurn && fields[1][1].player == playerTurn && fields[2][1].player == playerTurn
        let c3 = fields[0][2].player == playerTurn && fields[1][2].player == playerTurn && fields[2][2].player == playerTurn
        
        // check both diagonals (0,0 - 1,1 - 2,2) (0,2 - 1,1 - 2,0)
        let d1 = fields[0][0].player == playerTurn && fields[1][1].player == playerTurn && fields[2][2].player == playerTurn
        let d2 = fields[0][2].player == playerTurn && fields[1][1].player == playerTurn && fields[2][0].player == playerTurn
        
        //can be done in  loop but... trial and error ,which loop, forEach? for? while? WHICH ONE?!?!?! THE NUMBERS MASON!
        //nested for each loops use ij for rows, then ji for columns, use boolean value to define the true false
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            winner = ("\(playerTurn) is the winner!")
            winStatus = true
        }else if drawCounter == 9 {
            winner = "Draw :("
            winStatus = true
        }
    }
    
    func restartG()
    {
        fields = .init(repeating: .init(repeating: Field(player: "", enabled: true), count: 3 ), count: 3)
        playerTurn = "X"
        winner = ""
        winStatus = false
        drawCounter = 0
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Field {
    var player : String // player name/identification
    var enabled : Bool  // to check if box not used
}


// nav link to choose which board size to play.. but that might affect the effective screen size we can utilize
// so it might not be such a good idea to have a navlink to decide the size of the map
//struct ContentView: View {
//    @State var selectedsize = ""
//    var body: some View {
//        NavigationView {
//            List
//            {
//
//            }
//            }.navigationTitle("X-O-Woah!")
//        }
//    }

//        VStack {
//            Text("Welcome to X-O-Woah!")
//                .padding()
//
//            //button loop for the board of the X-O Game
//            ForEach (0..<3/*size of game*/){size in // row loop
//                HStack{
//                    ForEach(0..<3){size in /*loop for each column in one row (basically the cells*/
//                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
//                        })
//
//                    }
//                }
//            }
//        }


//        VStack{
//            Text("X-O-Woah!")
//                .font(.largeTitle)
//                .padding()
//            NavigationView{
//                VStack(alignment: .center){
//                    TextField("enter the size of the Board", text: $selectedsize)
//                        .font(.title)
//                        .padding()
//
//                    Button(action: {
//                        NavigationLink(
//                            destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
//                            label: {
//                                /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
//                            })
//                    }
//                           ,label: {
//                        Text("Begin!")
//                            .frame(width: 150, height: 50, alignment: .center)
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .clipShape(RoundedRectangle(cornerRadius: 10))
//                    })
//                }
//            }
