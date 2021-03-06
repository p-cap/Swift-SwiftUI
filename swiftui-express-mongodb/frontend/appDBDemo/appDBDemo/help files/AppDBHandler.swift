//
//  AppDBHandler.swift
//  appDBDemo
//
//  Created by Paul Capili on 3/5/21.

import Foundation

class AppDBHandler: ObservableObject {
    
    @Published var myResponse = [Software]()
    
    init() {
        guard let url = URL(string: "http://localhost:5555/apps") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let decodedResponse = try! JSONDecoder().decode([Software].self, from: data)
            DispatchQueue.main.async {
                self.myResponse = decodedResponse
            }
        }.resume()
    }
}



