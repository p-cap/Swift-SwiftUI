//
//  OrderSheet.swift
//  five-jan
//
//  Created by Paul Capili on 1/5/21.
//

import SwiftUI

struct OrderSheet: View {
    // we need to access to the viewContext first to persistently
    // save a created order
    // the view has now access to the device's scratchpad
    @Environment(\.managedObjectContext) private var viewContext
    
    // adding this environment property will help close our ordersheet
    @Environment (\.presentationMode) var presentationMode


    let pizzaTypes = ["Pizza Margherita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]
    
    @State var selectedPizzaIndex = 1
    @State var numberOfSlices = 1
    @State var tableNumber = ""
    
    var body: some View {
        NavigationView {
            Form {
                
                // the first section and stepper are on the same stepper
                Section(header: Text("Pizza Details")) {
                    Picker(selection: $selectedPizzaIndex, label: Text("Pizza Type")) {
                        ForEach(0 ..< pizzaTypes.count) {
                            Text(self.pizzaTypes[$0]).tag($0)
                        }
                    }
                    Stepper("\(numberOfSlices) Slices", value: $numberOfSlices, in: 1...12)
                }
                Section(header: Text("Table")) {
                    TextField("Table Number", text: $tableNumber)
                        .keyboardType(.numberPad)
                    
                }
                
                Button(action: {
                    
                    guard self.tableNumber != "" else {return}
                    let newOrder = Order(context: viewContext)
                    newOrder.pizzaType = self.pizzaTypes[self.selectedPizzaIndex]
                    newOrder.orderStatus = .pending
                    newOrder.tableNumber = self.tableNumber
                    newOrder.numberOfSlices = Int16(self.numberOfSlices)
                    newOrder.id = UUID()
                    do {
                        try viewContext.save()
                        print("Order Saved")
                        presentationMode.wrappedValue.dismiss()

                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Add Order")
                }
            }
            .navigationTitle("Add Order")
        }
    }
}


struct OrderSheet_Previews: PreviewProvider {
    static var previews: some View {
        OrderSheet()
    }
}
