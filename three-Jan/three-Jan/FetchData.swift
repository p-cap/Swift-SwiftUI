//
//  FetchData.swift
//  three-Jan
//
//  Created by Paul Capili on 1/3/21.
//

import Foundation

class FetchData: ObservableObject {

    @Published var users = [Users]()
     
    init() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let userData = data {
                    let decodedData = try JSONDecoder().decode([Users].self, from: userData)
                    DispatchQueue.main.async {
                        self.users = decodedData
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
}
