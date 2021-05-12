## 4주차 구현 
### ✂️ 도전 과제

<br/>

_**Token이 어딨어요.....?**_
<br/>

우리가 `Token`를 잡아오려면 `Token`이 어딨는지 알아야 합니다. `Token`은 Response된 Model에 함께 들어오기 때문에 아마도 Response Model를 가져오는 곳에 있을겁니다.

```swift
private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(UserModel.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        case 200: return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
}
```
- 아마도 이 친구가 `Token`를 잡아오는 거 같네요.
- 위에 `guard let decodedData = try? decoder.decode(UserModel.self, from: data)`, 이 부분에서 볼 수 있듯 UserModel를 decoding해주는 걸 볼 수 있어요.
- decode된 data는 우리가 쓸 수 있게끔 가공이 되어 있습니다.
- 그랫 decodedData.message에서 서버에서 보낸 메세지를 볼 수 있는거예요!!

<br/>
<br/>

#### Token를 잡아옵시다

<br/>

방금 그 코드에 `Token`를 가져오는 코드를 넣어줄게요.

```swift
private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(UserModel.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        case 200:
            if let token = decodedData.data?.token {
                UserDefaults.standard.set(token, forKey: "user")
            }
            return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
}
```
- `decodedData.data?.token`에 token이 숨어있었습니다..!!
- `optional` 형태로 저장되어있기에 잘 풀어서 "user"라는 key에 대한 value값으로 담아줄게요.
- `UserDefault`는 key-value 쌍으로 디바이스에 데이터를 저장하는 것을 도와주는 인터페이스입니다.
- 앱이 꺼져도 유지되는 데이터이기 때문에, `token`값을 UserDefault에 저장해두면 나중에 다시 로그인할 필요없이 사용자의 토큰을 보고 자동로그인을 시켜줄 수도 있겠죠??

<br/>

이제 잘 저장됐는지 확인해봅시다.

```swift
let standard = UserDefaults.standard

print(self.standard.value(forKey: "user") ?? 0)
```
- 윗 부분에 standard를 선언해주고 로그인하고 response를 가져오는 부분에 해당 print 코드를 넣어주었습니다.
- `token`값이 잘 나오는 걸 확인했습니다!!
