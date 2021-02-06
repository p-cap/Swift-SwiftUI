//
//  ContentView.swift
//  three-Jan
//
//  Created by Paul Capili on 1/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var fetchData: FetchData
    
    var body: some View {
        NavigationView {
        List(fetchData.users) { user in
            NavigationLink(destination: DetailView(user: user)) {
                UserRow(user: user)
            }
        }
        .navigationBarTitle("JsonplaceholderUser")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    
    static let fetchData = FetchData()
    
    static var previews: some View {
        ContentView().environmentObject(fetchData)
    }
}

