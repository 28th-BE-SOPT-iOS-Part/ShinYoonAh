### ๐ฟ ๋ทฐ ์ฌ์ด ์ด๋

#### ๋ก๊ทธ์ธ(ViewController) โ ํ์ธ(CheckViewController)
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
- ๋ก๊ทธ์ธ/ํ์๊ฐ์ ์: ๋ชจ๋  ํญ๋ชฉ์ด ์ฑ์์ ธ ์์ง ์์ผ๋ฉด ๋ฒํผ์ด ๋๋ฌ์ง๋ฉด ์๋จ <br/>
  โ `Optional` ์ ๊ฑฐ ํ์ ๊ฐ๊ฐ `TextField`์ ๊ฐ์ด ๋น์ด์์ง ์๋ค๋ฉด `storyboard`๋ฅผ ๋ถ๋ฆ
  โ ํด๋น `storyboard`์ ์๋ `user`๋ผ๋ ๊ฐ์ ์๋ ฅํ ์ด๋ฉ์ผ/์ ํ๋ฒํธ ์ ๋ฌ
  
#### ํ์๊ฐ์(RegisterViewController) โ ํ์ธ(CheckViewController)
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
- ๋ก๊ทธ์ธ๊ณผ ๋์ผํ๊ฒ `Optional`์ ๊ฑฐ + ๋น๋ฐ๋ฒํธ์ ๋น๋ฐ๋ฒํธ ํ์ธ์ด ๊ฐ์ผ๋ฉด ๋ฒํผ์ด enable๋๋ ๊ธฐ๋ฅ ์ถ๊ฐ
- RegisterViewController์์ `present`ํ  ๊ฒฝ์ฐ, CheckViewController์์ `dismiss`ํ๋ฉด RegisterViewController๋ก `dismiss`๋๋ ์ํฉ ๋ฐ์
  โ `completion`๋ฅผ ์ฌ์ฉํ์  <br/>

<br/> 
  
<img width="426" alt="week1" src="https://user-images.githubusercontent.com/55099365/113810605-94655900-97a5-11eb-8309-a8dac0b7faa7.png"> 

<br/>

โญ๏ธ `present`์ `completion`์ `presentation`์ด ์๋ฃ๋๊ณ  ๋ ํ์ ์คํ๋๋ค 
  โ CheckViewController๋ฅผ `present`ํ ํ์ `completion`๋ฅผ ์ฌ์ฉํด์ RegisterViewController๋ฅผ `pop`์ํค์!
  <br/>
```swift
present(dvc, animated: true) {
          self.navigationController?.popViewController(animated: false)
}
```

---
<br/>

### ๐ TextField 

<img width="282" alt="แแณแแณแแตแซแแฃแบ 2021-04-07 แแฉแแฎ 1 38 31" src="https://user-images.githubusercontent.com/55099365/113811104-8cf27f80-97a6-11eb-8a98-912274432fc0.png">

_**์ด๋ฐ ๋ชจ์ต์ผ๋ก TextField๋ฅผ ๋ง๋ค๋ ค๋ฉด ์ด๋ป๊ฒ ํด์ผํ ๊น?**_

๊ณผ์ ์์ ํด๋น `TextField`ํํ๋ฅผ ๊ณ์ ์ฌ์ฉํ๊ธฐ ๋๋ฌธ์, `UITextField`์ `Extension`๋ฅผ ์ฌ์ฉํด์ Underline์ด ์๋ `TextField`๋ฅผ ๊ตฌํํด์คฌ๋ค.
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
ํด๋น ํจ์๋ฅผ ์ฌ์ฉํด์ `TextField`์ ํํ๋ฅผ ์ก์ ์ ์๋ค.
```swift
func setTextField() {
        emailTextField.setTextFieldUnderLine()   
        passwordTextField.setTextFieldUnderLine()  
        confirmTextField.setTextFieldUnderLine()
}
```
