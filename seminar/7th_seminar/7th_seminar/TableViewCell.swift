//
//  TableViewCell.swift
//  7th_seminar
//
//  Created by SHIN YOON AH on 2021/05/29.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    static let identifier : String = "TableViewCell"
    
    @IBOutlet weak var sampleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data : String)
    {
        sampleLabel.text = data
    }

}
