//
//  ToDoDetailViewController.swift
//  Dev-To-Do-List
//
//  Created by p-cap on 11/18/20.
//  Copyright © 2020 p-cap. All rights reserved.
//

import UIKit

class ToDoDetailViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var commentField: UITextView!
    @IBOutlet var prioritySelected: UISegmentedControl!
    @IBOutlet var effortSelected: UISegmentedControl!
    
    var listItem: ListItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        titleField.text = listItem.title
        
        //segment control for priority
        switch listItem.priority {
        case "Won't":
            prioritySelected.selectedSegmentIndex = 0
        case "Could":
            prioritySelected.selectedSegmentIndex = 1
        case "Should":
            prioritySelected.selectedSegmentIndex = 2
        case "Must":
            prioritySelected.selectedSegmentIndex = 3
        default:
            listItem.priority = "Won't"
        }
        
        //segment control for effort
        switch listItem.effort {
        case "Easy":
            effortSelected.selectedSegmentIndex = 0
        case "Medium":
            effortSelected.selectedSegmentIndex = 1
        case "Hard":
            effortSelected.selectedSegmentIndex = 2
        default:
            listItem.effort = "Easy"
        }
        
        commentField.layer.borderWidth = 1
        commentField.layer.borderColor = UIColor.blue.cgColor
        commentField.text = listItem.comment
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // "Save" changes to item
        listItem.title = titleField.text ?? ""
        listItem.comment = commentField.text
    }
    
    @IBAction func effortSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            listItem.effort = sender.titleForSegment(at: 0)
        case 1:
            listItem.effort = sender.titleForSegment(at: 1)
        default:
            listItem.effort = sender.titleForSegment(at: 2)
        }
    }
    
    @IBAction func prioritySegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            listItem.priority = sender.titleForSegment(at: 0)
        case 1:
            listItem.priority = sender.titleForSegment(at: 1)
        case 2:
            listItem.priority = sender.titleForSegment(at: 2)
        default:
            listItem.priority = sender.titleForSegment(at: 3)
        }
        
    }
    
}
  

