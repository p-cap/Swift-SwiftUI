//
//  SampleTableViewController.swift
//  tableViewDemo
//
//  Created by Paul Capili on 2/28/21.
//

import UIKit

class SampleTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var sampleData = SampleData(sample: "", details: "")

    var filteredSample: [SampleData] = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
 
        searchController.obscuresBackgroundDuringPresentation = false
    
        searchController.searchBar.placeholder = "Search Samples"

        navigationItem.searchController = searchController

//        definesPresentationContext = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredSample.count
          }
        return sampleData.generateData().count
    }
    
    // this is called the datasource method
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: indexPath) as? SampleTableViewCell else {
            fatalError("The dequeued cell is not an instance of SampleTableViewCell.")
        }
        
        let info: SampleData
        
        if isFiltering {
            info = filteredSample[indexPath.row]
        } else {
            info = sampleData.generateData()[indexPath.row]
        }
          
        cell.sampleLabel.text = info.sample
        
        return cell
    }

    
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let row = tableView.indexPathForSelectedRow?.row {
            let item = sampleData.generateData()[row]
            let sampleDetailVC = segue.destination as! SampleDetailVC

            sampleDetailVC.detailData = item.details
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredSample = sampleData.generateData().filter { (sample: SampleData) -> Bool in
        return sample.sample.lowercased().contains(searchText.lowercased())
      }
      tableView.reloadData()
    }
}

extension SampleTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {

    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}
