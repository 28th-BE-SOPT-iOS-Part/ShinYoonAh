//
//  FirstViewController.swift
//  FirstSeminar
//
//  Created by SHIN YOON AH on 2021/04/03.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var presentTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        presentTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTextField.placeholder = "전달하고 싶은 내용"
    }

    @IBAction func touchUpButton(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
            return
        }
//        present(dvc, animated: true, completion: nil)
        if let text = presentTextField.text {
            dvc.message = text
        }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}
