//
//  BreadAndButterApp.swift
//  BreadAndButter
//
//  Created by Artem Goldenberg on 23.01.2021.
//

import SwiftUI

@main
struct BreadAndButterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
