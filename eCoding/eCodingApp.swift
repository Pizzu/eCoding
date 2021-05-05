//
//  eCodingApp.swift
//  eCoding
//
//  Created by Luca Lo Forte on 6/5/21.
//

import SwiftUI

@main
struct eCodingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
