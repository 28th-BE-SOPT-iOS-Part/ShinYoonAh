//
//  CheckViewController.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/07.
//

import UIKit

class CheckViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigure()
    }
    
    @IBAction func touchUpOK(_ sender: Any) {
        let navigationController = self.presentingViewController as? UINavigationController
            
        self.dismiss(animated: true) {
            let _ = navigationController?.popToRootViewController(animated: true)
        }
    }

    private func setConfigure() {
        if let user = user {
            welcomeLabel.text = "\(user)님\n 환영합니다"
        }
        welcomeLabel.font = .boldSystemFont(ofSize: 15)
        
        okButton.setTitle("확인", for: .normal)
        okButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        okButton.setTitleColor(.black, for: .normal)
        okButton.backgroundColor = UIColor.init(red: 1, green: 221/255, blue: 53/255, alpha: 1)
        okButton.contentEdgeInsets = .init(top: 13, left: 0, bottom: 13, right: 0)
        okButton.layer.cornerRadius = 5
    }
}
