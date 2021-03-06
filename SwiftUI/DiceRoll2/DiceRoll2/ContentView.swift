//
//  ContentView.swift
//  DiceRoll2
//
//  Created by Artem Goldenberg on 09.02.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var numbers = Numbers()
    
    var body: some View {
        TabView {
            DiceView()
                .tabItem {
                    Image(systemName: "die.face.4.fill")
                    Text("Dice")
                }
            
            ListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Rolls")
                }
        }
        .environmentObject(numbers)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
