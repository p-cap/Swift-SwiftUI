//
//  Details.swift
//  appDBDemo
//
//  Created by Paul Capili on 3/5/21.
//

import SwiftUI

struct Details: View {
    
    var software: Software
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                HStack {
                    Text("Appname:    ")
                    Text("\(software.AppName)")
                }
                HStack {
                    Text("Filename:    ")
                    Text("\(software.FileName)")
                }
                HStack {
                    Text("SHA-1:        ")
                    Text("\(software.Sha1)")
                }
                
            }
        }
       
    }
}

struct Details_Previews: PreviewProvider {
    
    static var software = Software(AppName: "Pcap", FileName: "Pcap.txt", Sha1: "random")
    
    static var previews: some View {
        Details(software: software)
    }
}
