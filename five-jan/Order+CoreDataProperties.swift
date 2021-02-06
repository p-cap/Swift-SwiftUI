//
//  Order+CoreDataProperties.swift
//  five-jan
//
//  Created by Paul Capili on 1/5/21.
//
//


// the purpose of this is to allow enum into the model

import Foundation
import CoreData


extension Order {
    
    @NSManaged public var status: String
    
    var orderStatus: Status {
        set {
            status = newValue.rawValue
        }
        get {
            Status(rawValue: status) ?? .pending
        }
    }
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var numberOfSlices: Int16
    @NSManaged public var pizzaType: String
    @NSManaged public var tableNumber: String

}

extension Order : Identifiable {

}

enum Status: String {
    case pending = "Pending"
    case preparing = "Preparing"
    case completed = "Completed"
}
