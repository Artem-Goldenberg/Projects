//
//  HabitView.swift
//  Habits
//
//  Created by Artem Goldenberg on 02.01.2021.
//

import SwiftUI

struct HabitView: View {
    var habit: Habit
    
    var body: some View {
        Group {
            Text(habit.description)
            
            Text("\(habit.timesCompleted) times completed")
            
            Button("Completed one more time!") {
                habit.timesCompleted += 1
            }
            .padding()
            .clipShape(Capsule())
            
        }
        .navigationBarTitle(habit.name)
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habit: Habit())
    }
}
