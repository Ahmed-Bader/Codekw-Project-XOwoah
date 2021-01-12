//
//  code reference.swift
//  XO-Woah
//
//  Created by Eng.Ahmed Bader on 12/01/2021.
//

import Foundation
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
//                        Button(action: = , label: {
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
