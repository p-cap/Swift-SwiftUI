//
//  UserRow.swift
//  three-Jan
//
//  Created by Paul Capili on 1/3/21.
//

import SwiftUI

struct UserRow: View {
    
    var user: Users
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(user.name)
            }
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    
    static var previews: some View {
        UserRow(user: Users.sample)
    }
}
