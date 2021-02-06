//
//  ContentView.swift
//  four-jan
//
//  Created by Paul Capili on 1/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Text("Sample Login Page")
                        .padding()
                        .foregroundColor(.blue)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    TextField("Username", text: $username)
                        .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .cornerRadius(4)
                    SecureField("password", text: $password)
                        .frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .cornerRadius(6)
                        .padding()
                    VStack{
                             NavigationLink(destination: SuccessfulPage(username: $username), isActive: self.$isActive) {
                                 Text("")
                             }
                             Button("Login"){
                                if username == "Admin" && password == "Admin" {
                                 self.isActive = true
                                }
                             }.foregroundColor(.white)
                             .padding(.all, 10)
                             .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            }
                    Spacer()
                }
                
            }
          
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
