//
//  SampleList.swift
//  Dev-To-Do-List
//
//  Created by p-cap on 11/18/20.
//  Copyright © 2020 p-cap. All rights reserved.
//

import UIKit


class List {
    
    var toDoList = [ListItem]()
    
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.plist")
    }()
    
    
    init() {
        do {
            let data = try Data(contentsOf: itemArchiveURL)
            let unarchiver = PropertyListDecoder()
            let items = try unarchiver.decode([ListItem].self, from: data)
            toDoList = items
        } catch {
            print("Error reading in saved items: \(error)")
        }
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveChanges),
                                       name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    
    //created function for my sample inputs
    func displaySampleListItem() -> [ListItem]? {
        let sample = [
            ListItem(title: "API Docs", effort: "Medium", priority: "Should", comment: "Annotate API Docs in Readme file"),
            ListItem(title: "Testing", effort: "Hard", priority: "Must", comment: "Please do unit testing before deployment"),
            ListItem(title: "Design images", effort: "Easy", priority: "Could", comment: "please download images for UI")
        ]
        
        
        
        if !sample.allSatisfy(toDoList.contains) {
            toDoList.append(contentsOf: sample)
            return sample
        }

        return nil
    }
    
   //adding empty array ListItem
    @discardableResult func details() -> ListItem {
        let listItem = ListItem(title: "", effort: "", priority: "", comment: "")
        toDoList.append(listItem)
        return listItem
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        // Get reference to object being moved so you can reinsert it
        let movedItem = toDoList[fromIndex]
        // Remove item from array
        toDoList.remove(at: fromIndex)
        // Insert item in array at new location
        toDoList.insert(movedItem, at: toIndex)
    }
    
    //deleting rows
    func removeItem(_ item: ListItem) {
        if let index = toDoList.firstIndex(of: item) {
            toDoList.remove(at: index) }
    }
    
    //save data
    @objc func saveChanges() -> Bool {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(toDoList)
            try data.write(to: itemArchiveURL, options: [.atomic])
            print("Saved all of the items")
            return true
        } catch let encodingError {
            print("Error encoding toDoList: \(encodingError)")
            return false
        }
       
    }
}

