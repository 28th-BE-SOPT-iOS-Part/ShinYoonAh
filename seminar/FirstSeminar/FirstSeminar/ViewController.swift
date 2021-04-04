//
//  ViewController.swift
//  FirstSeminar
//
//  Created by SHIN YOON AH on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "텍스트 텍스트"
    }
    
    @IBAction func touchUpButton(_ sender: Any) {
        print("click")
        if let name = nameTextField.text, let phoneNumber = phoneNumberTextField.text {
            if name != "" && phoneNumber != "" {
                titleLabel.text = "\(name)의 번호는 \(phoneNumber)입니다!"
                titleLabel.textColor = .red
            }
        }
    }
}

