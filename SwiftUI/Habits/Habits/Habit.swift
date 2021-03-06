//
//  Habit.swift
//  Habits
//
//  Created by Artem Goldenberg on 02.01.2021.
//

import Foundation

class Habit: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var timesCompleted: Int
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.timesCompleted = 0
    }
    
    init() {
        name = ""
        description = ""
        timesCompleted = 0
    }
    
}

class Habits: ObservableObject {
    @Published var array = [Habit]() {
        didSet {
            if let encoder =  try? JSONEncoder().encode(array) {
                UserDefaults.standard.set(encoder, forKey: "Habits")
            }
        }
    }
    
    required init() {
        if let array = UserDefaults.standard.data(forKey: "Habits") {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: array) {
                self.array = decoded
                return
            }
        }
        self.array = []
    }
}
