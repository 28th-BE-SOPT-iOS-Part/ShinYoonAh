//
//  FriendListVC.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import UIKit

class FriendListVC: UIViewController {
    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpProfile(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC else {
            return
        }
        dvc.modalPresentationStyle = .overCurrentContext
        present(dvc, animated: true, completion: nil)
    }
}
