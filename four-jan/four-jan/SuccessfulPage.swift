//
//  SuccessfulPage.swift
//  four-jan
//
//  Created by Paul Capili on 1/4/21.
//

import SwiftUI

struct SuccessfulPage: View {
    
    @Binding var username: String
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text("Welcome \(username)")
        }
    }
}

#if DEBUG

struct SuccessfulPage_Previews: PreviewProvider {
    
    static var previews: some View {
        SuccessfulPage(username: .constant("Phil"))
    }
}
#endif
