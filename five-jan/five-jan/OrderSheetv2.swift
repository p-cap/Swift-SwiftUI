//
//  OrderSheetv2.swift
//  five-jan
//
//  Created by Paul Capili on 1/6/21.
//

import SwiftUI

struct OrderSheetv2: View {
    
    // access to the device's scratchpad
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment (\.presentationMode) var presentationMode
    
    let pizzaTypes = ["Pizza Margherita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]
    
    @State var selectedPizzaIndex = 1
    @State var numberOfSlices = 1
    @State var tableNumber = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pizza Details")) {
                    Picker(selection: $selectedPizzaIndex, label: Text("Pizza Type"), content: {
                        ForEach(0 ..< pizzaTypes.count) { pizza in
                            Text(self.pizzaTypes[pizza])
                        }
                    })
                    Stepper("\(numberOfSlices) Slices", value: $numberOfSlices, in: 1...12)
                }
                Section(header: Text("Table")) {
                    TextField("Table Number", text: $tableNumber)
                        .keyboardType(.numberPad)
                    
                }
                Button(action: {
                    guard self.tableNumber != "" else {return}
                    let newOrder = Order(context: <#T##NSManagedObjectContext#>)
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
            }
        }
        
    }
}



struct OrderSheetv2_Previews: PreviewProvider {
    static var previews: some View {
        OrderSheetv2()
    }
}
