//
//  FriendTVC.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/27.
//

import UIKit

class FriendTVC: UITableViewCell {
    static let identifier = "FriendTVC"

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setConfigure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension FriendTVC {
    private func setConfigure() {
        statusLabel.textColor = .kakaoGray
    }
    
    func setData(image: String, userName: String, status: String) {
        if let image = UIImage(named: image) {
            profileImage.image = image
        }
        
        userNameLabel.text = userName
        statusLabel.text = status
    }
}
