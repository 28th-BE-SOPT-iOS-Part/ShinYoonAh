//
//  SecondViewController.swift
//  FirstSeminar
//
//  Created by SHIN YOON AH on 2021/04/03.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
    }

    @IBAction func touchUpDismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setLabel() {
        if let msg = message {
            messageLabel.text = msg
        }
    }
}
