//
//  ViewController.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        setTextField()
        setButton()
    }
    
    @IBAction func touchUpLogin(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email != "" && password != "" {
                let sb = UIStoryboard.init(name: "Tabbar", bundle: nil)
                guard let dvc = sb.instantiateViewController(identifier: "TabbarController") as? TabbarController else {
                    return
                }
                dvc.modalPresentationStyle = .fullScreen
                present(dvc, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func touchUpRegister(_ sender: Any) {
        guard let dvc = storyboard?.instantiateViewController(identifier: "RegisterViewController") as? RegisterViewController else {
            return
        }
        navigationController?.pushViewController(dvc, animated: true)
    }
}

extension ViewController {
    private func setLabel() {
        infoLabel.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        infoLabel.textColor = .darkGray
    }
    
    private func setTextField() {
        emailTextField.setTextFieldUnderLine()
        emailTextField.placeholder = "이메일 또는 전화번호"
        emailTextField.clearButtonMode = .whileEditing
        
        passwordTextField.setTextFieldUnderLine()
        passwordTextField.placeholder = "비밀번호"
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setButton() {
        loginButton.setTitle("카카오계정 로그인", for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        loginButton.contentEdgeInsets = .init(top: 13, left: 0, bottom: 13, right: 0)
        loginButton.layer.cornerRadius = 5
        
        registerButton.setTitle("새로운 카카오계정 만들기", for: .normal)
        registerButton.titleLabel?.font = .boldSystemFont(ofSize: 13)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        registerButton.contentEdgeInsets = .init(top: 13, left: 0, bottom: 13, right: 0)
        registerButton.layer.cornerRadius = 5
    }
}

