//
//  TableViewCell.swift
//  ThirdSenimar
//
//  Created by SHIN YOON AH on 2021/04/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(image: String, title: String, subtitle: String) {
        if let image = UIImage(named: image) {
            iconImageView.image = image
        }
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }

}
