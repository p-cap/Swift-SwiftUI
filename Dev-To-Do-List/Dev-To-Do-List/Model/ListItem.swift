//
//  List.swift
//  Dev-To-Do-List
//
//  Created by p-cap on 11/18/20.
//  Copyright © 2020 p-cap. All rights reserved.
//

import UIKit

class ListItem: Equatable, Codable {
    var title: String?
    var effort: String?
    var priority: String?
    var comment: String?
    
    init(title: String?, effort: String?, priority: String?, comment: String?) {
        self.title = title
        self.effort = effort
        self.priority = priority
        self.comment = comment
    }
    
    static func == (lhs: ListItem, rhs: ListItem) -> Bool {
           return lhs.title == rhs.title
               && lhs.effort == rhs.effort
               && lhs.priority == rhs.priority
               && lhs.comment == rhs.comment
        
       }
}
