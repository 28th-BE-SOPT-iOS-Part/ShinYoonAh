//
//  RegisterViewController.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/07.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setButton()
    }
    
    @IBAction func touchUpRegister(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text, let confirm = confirmTextField.text {
            if email != "" && password != ""
                && confirm != "" && password == confirm {
                guard let dvc = storyboard?.instantiateViewController(identifier: "CheckViewController") as? CheckViewController else {
                    return
                }
                dvc.user = email
                dvc.modalPresentationStyle = .fullScreen
                present(dvc, animated: true) {
                    self.navigationController?.popViewController(animated: false)
                }
            }
        }
    }
    
    private func setTextField() {
        emailTextField.setTextFieldUnderLine()
        emailTextField.placeholder = "이메일 또는 전화번호"
        emailTextField.clearButtonMode = .whileEditing
        
        passwordTextField.setTextFieldUnderLine()
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.isSecureTextEntry = true
        
        confirmTextField.setTextFieldUnderLine()
        confirmTextField.placeholder = "비밀번호 확인"
        confirmTextField.clearButtonMode = .whileEditing
        confirmTextField.isSecureTextEntry = true
    }
    
    private func setButton() {
        registerButton.setTitle("새로운 카카오계정 만들기", for: .normal)
        registerButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        registerButton.contentEdgeInsets = .init(top: 13, left: 0, bottom: 13, right: 0)
        registerButton.layer.cornerRadius = 5
    }
}
