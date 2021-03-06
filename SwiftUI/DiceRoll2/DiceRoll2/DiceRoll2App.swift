//
//  DiceRoll2App.swift
//  DiceRoll2
//
//  Created by Artem Goldenberg on 09.02.2021.
//

import SwiftUI

@main
struct DiceRoll2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
