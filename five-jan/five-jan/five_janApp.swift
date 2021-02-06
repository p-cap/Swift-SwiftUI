//
//  five_janApp.swift
//  five-jan
//
//  Created by Paul Capili on 1/5/21.
//

import SwiftUI

@main
struct five_janApp: App {
    
    // This is the struct that is declared in the project
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


// Reference: https://blckbirds.com/post/core-data-and-swiftui/
