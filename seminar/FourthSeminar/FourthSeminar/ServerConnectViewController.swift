//
//  ServerConnectViewController.swift
//  FourthSeminar
//
//  Created by SHIN YOON AH on 2021/05/08.
//

import UIKit

class ServerConnectViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeAlert(title: "알림", message: "로그인 성공 ^o^")
    }

    
    @IBAction func touchUpGET(_ sender: Any) {
        GetPersonDataService.shared.getPersonInfo { (response) in
            switch (response) {
            case .success(let personData):
                if let data = personData as? Person {
                    self.nameLabel.text = data.name
                    self.messageLabel.text = data.profileMessage
                }
            case .requestErr(let message):
                print("requestErr", message)
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("ServerErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    @IBAction func touchUpPOST(_ sender: Any) {
        self.makeRequestAlert(title: "알림",
                            message: "로그인을 하시겠습니까?",
                            okAction: { _ in
                                self.loginAction()
                            })
    }
    
    func loginAction(){
        LoginService.shared.login(email: self.idTextField.text!, password: self.passwordTextField.text!) { result in
        switch result {
        case .success(let message):
            if let message = message as? String{
                self.makeAlert(title: "알림",
                            message: message)
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

extension ServerConnectViewController
{
    func makeRequestAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)?,
                   cancelAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil)
    {
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
        alertViewController.addAction(cancelAction)
        

        self.present(alertViewController, animated: true, completion: completion)
    }
    
    
    func makeAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil)
    {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
