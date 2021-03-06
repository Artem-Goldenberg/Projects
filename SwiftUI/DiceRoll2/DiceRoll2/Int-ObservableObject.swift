//
//  Int-ObservableObject.swift
//  DiceRoll2
//
//  Created by Artem Goldenberg on 09.02.2021.
//

import Foundation


struct ListItem: Identifiable {
    var id = UUID()
    var value: Int
}

class Numbers: ObservableObject {
    @Published private(set) var array: [ListItem]
    
    init() {
        array = []
    }
    
    func add(value: Int) {
        let newItem = ListItem(value: value)
        self.array.insert(newItem, at: 0)
    }
}
