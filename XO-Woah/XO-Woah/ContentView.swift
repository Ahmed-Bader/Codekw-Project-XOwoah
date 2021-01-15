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
                Spacer()
                NavigationLink(
                    destination: Game(size: 3, drawLimit: 9),
                    label: {
                        Text("2-players")
                            .font(.largeTitle)
                            .frame(width: 300, height: 70, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }).navigationTitle("Welcome to X-O-Woah!")
                
                NavigationLink(
                    destination: Game(size: 4, drawLimit: 16),
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
                    destination: Game(size: 5, drawLimit: 25),
                    label: {
                        Text("4-players")
                            .font(.largeTitle)
                            .frame(width: 300, height: 70, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                Spacer()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




