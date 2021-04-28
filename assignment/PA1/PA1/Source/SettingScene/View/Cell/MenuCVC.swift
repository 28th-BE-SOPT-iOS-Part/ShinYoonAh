//
//  MenuCVC.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/28.
//

import UIKit

class MenuCVC: UICollectionViewCell {
    static let identifier = "MenuCVC"

    @IBOutlet weak var menuLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setLabel(menu: String) {
        menuLabel.text = menu
    }
}
