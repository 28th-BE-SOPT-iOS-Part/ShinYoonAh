//
//  DelegateViewController.swift
//  ThirdSenimar
//
//  Created by SHIN YOON AH on 2021/04/24.
//

import UIKit

protocol DataSend {
    func sendData(data: String)
}

class DelegateViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    var delegate: DataSend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpButton(_ sender: Any) {
        if let text = textField.text {
            NotificationCenter.default.post(name: NSNotification.Name("sample"), object: text)
            delegate?.sendData(data: text)
        }
        navigationController?.popViewController(animated: true)
    }
    
}
