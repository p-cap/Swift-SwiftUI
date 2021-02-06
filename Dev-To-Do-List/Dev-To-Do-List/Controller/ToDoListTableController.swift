//
//  ToDoListTableController.swift
//  Dev-To-Do-List
//
//  Created by p-cap on 11/18/20.
//  Copyright © 2020 p-cap. All rights reserved.
//

import UIKit

class ToDoListTableController: UITableViewController {

    var list = List()
    
    //add button
    @IBAction func addNewToDoItem(_ sender: UIBarButtonItem) {
            performSegue(withIdentifier: "addDetails", sender: sender)
    }
    
    //edit button
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        
        //render sample data
        list.displaySampleListItem()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.toDoList.count
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
        let item = list.toDoList[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.priorityLabel.text = item.priority
        cell.effortLabel.text = item.effort
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        list.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    //enables deletion
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = list.toDoList[indexPath.row]
            // Remove the item from the store
            list.removeItem(item)
            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic) }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        //goes to the detail page of an existing to do list item
        case "showToDoDetail":
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let item = list.toDoList[row]
                let toDoDetailViewController
                    = segue.destination as! ToDoDetailViewController
                toDoDetailViewController.listItem = item
            }
            
        //redirects to the details page to add a new to do list item
        case "addDetails":
            let item = list.details()
            if let index = list.toDoList.firstIndex(of: item) {
                let indexPath = IndexPath(row: index, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            let toDoDetailViewController = segue.destination as! ToDoDetailViewController
            toDoDetailViewController.listItem = item
            
        default:
                preconditionFailure("Unexpected segue identifier.")
            }
    }
}
