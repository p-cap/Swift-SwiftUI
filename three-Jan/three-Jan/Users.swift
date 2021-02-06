//
//  Results.swift
//  three-Jan
//
//  Created by Paul Capili on 1/3/21.
//

import Foundation

struct Users: Identifiable, Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
    var website: String
     
    static let sample = Users(id: 90, name: "phil", username: "soccer_dude", email: "phil_awesome@great.com", phone: "777-777-7777", website: "www.philly.com")
}


