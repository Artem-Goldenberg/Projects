//
//  SheetView.swift
//  Habits
//
//  Created by Artem Goldenberg on 02.01.2021.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habits: Habits
    
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name", text: $name)
                TextField("description", text: $description)
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing: Button(action: {
                let habit = Habit(name: name, description: description)
                self.habits.array.append(habit)
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Save")
            })
            .disabled(name.isEmpty || description.isEmpty)
            )
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(habits: Habits())
    }
}
