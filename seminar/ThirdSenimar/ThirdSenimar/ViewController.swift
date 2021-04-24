//
//  ViewController.swift
//  ThirdSenimar
//
//  Created by SHIN YOON AH on 2021/04/24.
//

import UIKit

class ViewController: UIViewController, DataSend {
    func sendData(data: String) {
        mainLabel.text = data
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpButton(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(identifier: "DelegateViewController") as? DelegateViewController else {
            return
        }
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived), name: NSNotification.Name("sample"), object: nil)
        //dvc.delegate = self
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @objc
    func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {
            mainLabel.text = text
        }
    }
    
}

