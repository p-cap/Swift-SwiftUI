//
//  ResultRow.swift
//  appDBDemo
//
//  Created by Paul Capili on 3/5/21.
//

import SwiftUI

struct ResultRow: View {
    
    
    var result: String
    
    var software: Software
    
    var body: some View {
        NavigationLink(destination: Details(software: software)) {
            Text(result)
        }
    }
}
struct ResultRow_Previews: PreviewProvider {
    
    static var result = String()
    
    static var software = Software(AppName: "", FileName: "", Sha1: "")
    
    static var previews: some View {
        ResultRow(result: "", software: software)
    }
}
