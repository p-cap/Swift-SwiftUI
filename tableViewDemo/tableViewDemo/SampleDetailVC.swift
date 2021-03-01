//
//  ViewController.swift
//  tableViewDemo
//
//  Created by Paul Capili on 2/28/21.
//

import UIKit

class SampleDetailVC: UIViewController {
    
    var detailData: String!
    
    @IBOutlet var buttonLabel: UIButton!
    
    @IBOutlet var detailLabel: UILabel!

    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = detailData
        buttonLabel.setTitle("Close", for: .normal)
    }
}

