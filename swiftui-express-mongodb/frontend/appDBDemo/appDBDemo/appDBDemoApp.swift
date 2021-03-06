//
//  appDBDemoApp.swift
//  appDBDemo
//
//  Created by Paul Capili on 3/5/21.
//

import SwiftUI

@main
struct appDBDemoApp: App {
    
    @State private var text = ""
    @ObservedObject private var software = AppDBHandler()
    
    var body: some Scene {

        WindowGroup {
            ContentView(text: $text, softwares: software)
        }
    }
}
