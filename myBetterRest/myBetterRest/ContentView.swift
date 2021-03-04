//
//  ContentView.swift
//  myBetterRest
//
//  Created by Paul Capili on 3/3/21.
//

import SwiftUI
import CoreML

struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    static var defaultSleepTime: Date {
        var components = DateComponents()
        components.hour = 9
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var sleepTime = defaultSleepTime
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("", selection: $wakeUp,
                               displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                Section {
                    Text("What time you sleep")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $sleepTime,
                               displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                }
                Section {
                    VStack (alignment: .leading, spacing: 0) {
                        Text("Desired amount of sleep")
                            .font(.headline)
                        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                            Text("\(sleepAmount, specifier: "%g") hours")
                        }
                    }
                }
                
            }.navigationBarTitle("Coffee")
            // run the method is tapped
            // it won't return anything
            .navigationBarItems(trailing:
                                    Button(action: calculateBedtime) {
                                        Text("Calculate")
                                    }.alert(isPresented: $showingAlert) {
                                        Alert(title: Text(alertTitle), message: Text(alertMessage),
                                              dismissButton: .default(Text("OK")))
                                    })
        }
    }
    
    func calculateBedtime() {
        let components =
            Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        
        let anotherComponents = Calendar.current.dateComponents([.hour, .minute], from: sleepTime)
        let anotherHour = (anotherComponents.hour ?? 0) * 60 * 60
        let anotherMinute = (anotherComponents.minute ?? 0) * 60
        
        
        do {
            let model: CoffeeRegressor = try CoffeeRegressor(configuration: MLModelConfiguration())
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, actualSleep: Double(anotherHour + anotherMinute))
            
            showingAlert = true
            alertMessage = String(format: "%f", prediction.coffee)
            alertTitle = "You can drink up to…"
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
            showingAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
