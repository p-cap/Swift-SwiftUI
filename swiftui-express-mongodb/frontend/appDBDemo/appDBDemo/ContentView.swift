//
//  ContentView.swift
//  appDBDemo
//
//  Created by Paul Capili on 3/5/21.
//

import SwiftUI

struct ContentView: View {
    
    // when I initialize the state variable to empty
    // the struct ContentView_Previews does not complain
    
    // Use a binding to create a two-way connection between a property that stores data, and a view that displays and changes the data
    @Binding var text: String
    
    @ObservedObject var softwares = AppDBHandler()
    
    var body: some View {
        NavigationView {
            Form {
                VStack {
                    Text("Enter Search Term")
                    SeacrhBar(text: $text)
                }
                Section {
                    Text("Results").foregroundColor(.green)
                    ForEach(softwares.myResponse, id: \.self) { item in
                        if item.AppName.contains(text) || item.FileName.contains(text) ||
                            item.Sha1.contains(text)
                        {
                            ResultRow(result: item.AppName, software: item)
                            ResultRow(result: item.FileName, software: item)
                            ResultRow(result: item.Sha1, software: item)
                        }
                    }
                }
            }.navigationTitle("Pcap's App Search")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    @State static var appsName = AppDBHandler()
    
    static var previews: some View {
        ContentView(text: .constant(""), softwares: appsName)
    }
}


// Endpoints

//app.get('/', AppsController.greeting)
//
//    app.get('/apps', AppsController.read)
//
//    app.post('/add', AppsController.create)
//
//    app.put('/update/:appName', AppsController.edit)
//
//    app.delete('/delete/:appName', AppsController.delete)



