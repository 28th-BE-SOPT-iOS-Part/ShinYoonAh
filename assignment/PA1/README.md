### 🌿 뷰 사이 이동

#### 로그인(ViewController) → 확인(CheckViewController)
```swift
 @IBAction func touchUpLogin(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email != "" && password != "" {
                guard let dvc = storyboard?.instantiateViewController(identifier: "CheckViewController") as? CheckViewController else {
                    return
                }
                dvc.user = email
                dvc.modalPresentationStyle = .fullScreen
                present(dvc, animated: true, completion: nil)
            }
        }
    }
```
- 로그인/회원가입 시: 모든 항목이 채워져 있지 않으면 버튼이 눌러지면 안됨 <br/>
  → `Optional` 제거 후에 각각 `TextField`의 값이 비어있지 않다면 `storyboard`를 부름
  → 해당 `storyboard`에 있는 `user`라는 값에 입력한 이메일/전화번호 전달
  
#### 회원가입(RegisterViewController) → 확인(CheckViewController)
```swift
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
```
- 로그인과 동일하게 `Optional`제거 + 비밀번호와 비밀번호 확인이 같으면 버튼이 enable되는 기능 추가
- RegisterViewController에서 `present`할 경우, CheckViewController에서 `dismiss`하면 RegisterViewController로 `dismiss`되는 상황 발생
  → `completion`를 사용하자  <br/>

<br/> 
  
<img width="426" alt="week1" src="https://user-images.githubusercontent.com/55099365/113810605-94655900-97a5-11eb-8309-a8dac0b7faa7.png"> 

<br/>

⭐️ `present`의 `completion`은 `presentation`이 완료되고 난 후에 실행된다 
  → CheckViewController를 `present`한 후에 `completion`를 사용해서 RegisterViewController를 `pop`시키자!
  <br/>
```swift
present(dvc, animated: true) {
          self.navigationController?.popViewController(animated: false)
}
```

---
<br/>

### 🍀 TextField 

<img width="282" alt="스크린샷 2021-04-07 오후 1 38 31" src="https://user-images.githubusercontent.com/55099365/113811104-8cf27f80-97a6-11eb-8a98-912274432fc0.png">

_**이런 모습으로 TextField를 만들려면 어떻게 해야할까?**_

과제에서 해당 `TextField`형태를 계속 사용하기 때문에, `UITextField`에 `Extension`를 사용해서 Underline이 있는 `TextField`를 구현해줬다.
```swift
extension UITextField {
    func setTextFieldUnderLine() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height-3, width: self.frame.width-40, height: 1)
        border.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3).cgColor
        self.layer.addSublayer(border)
        self.borderStyle = .none
    }
}
```
해당 함수를 사용해서 `TextField`의 형태를 잡을 수 있다.
```swift
func setTextField() {
        emailTextField.setTextFieldUnderLine()   
        passwordTextField.setTextFieldUnderLine()  
        confirmTextField.setTextFieldUnderLine()
}
```
