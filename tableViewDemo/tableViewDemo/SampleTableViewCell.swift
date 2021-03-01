//
//  SampleTableViewCell.swift
//  tableViewDemo
//
//  Created by Paul Capili on 2/28/21.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    var sampleData = SampleData(sample: "", details: "")
    
    @IBOutlet var sampleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
