//
//  SampleData.swift
//  tableViewDemo
//
//  Created by Paul Capili on 2/28/21.
//

import Foundation

struct SampleData {
    var sample: String
    var details: String
    
    func generateData() -> [SampleData] {
        [SampleData(sample: "Sample1", details: "This is sample one"),
         SampleData(sample: "Sample2", details: "This is sample two"),
         SampleData(sample: "Sample3", details: "This is sample three")
        ]
    }
}
