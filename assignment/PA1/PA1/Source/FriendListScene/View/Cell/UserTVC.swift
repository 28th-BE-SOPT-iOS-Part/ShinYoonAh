//
//  UserTVC.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/27.
//

import UIKit

class UserTVC: UITableViewCell {
    static let identifier = "UserTVC"

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setConfigure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UserTVC {
    private func setConfigure() {
        statusLabel.textColor = .kakaoGray
        
        bottomView.backgroundColor = .kakaoLightGray
    }
    
    func setData(image: String, userName: String, status: String) {
        if let image = UIImage(named: image) {
            profileImage.image = image
        }
        
        userNameLabel.text = userName
        statusLabel.text = status
    }
}
