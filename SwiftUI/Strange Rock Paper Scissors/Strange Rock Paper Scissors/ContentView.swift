//
//  ContentView.swift
//  Strange Rock Paper Scissors
//
//  Created by Artem Goldenberg on 30.11.2020.
//  Copyright © 2020 Artem Goldenberg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let options = ["Rock", "Paper", "Scissors"]
    let outcomes = ["Draw", "Win", "Lose"]
    
    
    @State private var choice = Int.random(in: 0..<3)
    @State private var outcome = Int.random(in: 0..<3)
    @State private var score = 0
    @State private var showAlert1 = false
    @State private var showAlert2 = false
    @State private var counter = 1
    @State private var win = false
    
    var body: some View {
        VStack {
            Text("Your score is: \(score)")
            Text("Opponent has \(options[choice])")
            Text("You need to \(outcomes[outcome])")
            HStack {
                ForEach(options, id: \.self){ option in
                    Button(action: {
                      //  self.showAlert1 = true
                        switch self.outcome {
                        case 0: self.win = (option == self.options[self.choice])
                        case 1: self.win = (option == self.options[(self.choice + 1) % 3])
                        case 2: self.win = (option == self.options[(self.choice - 1 + 3) % 3])
                        default: break
                        }
                        self.score += (self.win ? 1 : -1)
                        self.showAlert1 = true
                    }) {
                        Text("\(option)")
                    }
                }
            }
            .alert(isPresented: $showAlert1) {
                Alert(title: (win ? Text("Correct!") : Text("Wrong(")), dismissButton: .default(Text("Continue")){
                    self.next()
                    })
            }
//            .alert(isPresented: $showAlert2) {
//                Alert(title: Text("End of the game!"), message: Text("Your schore is \(score)"), dismissButton: .default(Text("End")){self.newGame()
//                    self.next()})
//            }
        }
    }
    func next() {
        outcome = Int.random(in: 0..<3)
        choice = Int.random(in: 0..<3)
        win = false
        if (counter == 10) {showAlert2 = true}
        counter += 1
    }
    func newGame() { counter = 0; score = 0 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
