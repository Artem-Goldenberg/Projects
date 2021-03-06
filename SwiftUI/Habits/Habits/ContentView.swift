//
//  ContentView.swift
//  Habits
//
//  Created by Artem Goldenberg on 02.01.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.array, id: \.id) { habit in
                    NavigationLink(destination: HabitView(habit: habit)) {
                        Text(habit.name).font(.headline)
                    }
                }
                .onDelete(perform: { indexSet in
                    habits.array.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Habits")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showSheet = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showSheet) {
                SheetView(habits: habits)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
