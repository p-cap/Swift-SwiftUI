//
//  DetailView.swift
//  three-Jan
//
//  Created by Paul Capili on 1/3/21.
//

import SwiftUI

struct DetailView: View {
    
//    @EnvironmentObject var fetchData: FetchData
    
    var user: Users
    
    var body: some View {
        VStack {
            Text(user.username)
            Text(user.email)
            Text(user.phone)
            Text(user.website)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: Users.sample)
    }
}
