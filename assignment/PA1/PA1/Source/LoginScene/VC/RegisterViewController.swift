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
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirm = confirmTextField.text {
            print("pass: \(password) confirm: \(confirm)")
            if !email.isEmpty && !password.isEmpty
                && !confirm.isEmpty && password == confirm {
                signupAction()
            } else {
                makeAlert(title: "회원가입", message: "조건을 충족하세요")
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
    
    func signupAction() {
        LoginService.shared.signup(email: emailTextField.text!, password: passwordTextField.text!, sex: "0", nickname: "sopt_test", phone: "010-0000-0000", birth: "1996-02-24") { result in
                switch result {
                case .success(let message):
                    if let message = message as? String{
                        self.makeAlert(title: "알림",
                                       message: message,
                        okAction: { _ in
                            let sb = UIStoryboard.init(name: "Tabbar", bundle: nil)
                            guard let dvc = sb.instantiateViewController(identifier: "TabbarController") as? TabbarController else {
                                return
                            }
                            dvc.modalPresentationStyle = .fullScreen
                            self.present(dvc, animated: true) {
                                self.navigationController?.popViewController(animated: false)
                            }
                        })
                    }
                case .requestErr(let message):
                    if let message = message as? String{
                        self.makeAlert(title: "알림",
                                  message: message)
                    }
                default :
                    print("ERROR")
                }
            }
        }
}
