//
//  CollectionViewCell.swift
//  ThirdSenimar
//
//  Created by SHIN YOON AH on 2021/04/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    func setData(image: String, title: String, subtitle: String) {
        if let image = UIImage(named: image) {
            profileImage.image = image
        }
        titleLabel.text = title
        singerLabel.text = subtitle
    }
}
