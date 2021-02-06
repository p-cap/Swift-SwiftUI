//
//  three_JanApp.swift
//  three-Jan
//
//  Created by Paul Capili on 1/3/21.
//

import SwiftUI

@main
struct three_JanApp: App {
    
    var fetchData = FetchData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(fetchData)
        }
    }
}


// References:
// API = https://jsonplaceholder.typicode.com/users
// "SwiftUI Fetch JSON Data into List" = https://www.ioscreator.com/tutorials/swiftui-json-list-tutorial
// "How to add NavigationView to List in SwiftUI and show detail view using NavigationLink" = https://www.simpleswiftguide.com/how-to-add-navigationview-to-list-in-swiftui-and-show-detail-view-using-navigationlink/
