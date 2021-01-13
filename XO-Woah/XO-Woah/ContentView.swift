//
//  ContentView.swift
//  XO-Woah
//
//  Created by Eng.Ahmed Bader on 11/01/2021.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(
                    destination: Game(size: 3, drawLimit: 9),
                    label: {
                        Text("2-players")
                            .font(.largeTitle)
                            .frame(width: 300, height: 70, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }).navigationTitle("X-O-Woah!")
                
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        Text("3-players")
                            .font(.largeTitle)
                            .frame(width: 300, height: 70, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                    })
                
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        Text("4-players")
                            .font(.largeTitle)
                            .frame(width: 300, height: 70, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




