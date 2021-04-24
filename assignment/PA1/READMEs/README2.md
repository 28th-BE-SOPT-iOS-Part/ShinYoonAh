## 2주차 구현 영상
<img height="500" src="https://user-images.githubusercontent.com/55099365/114491932-7a6ac100-9c52-11eb-89dd-7819cf818185.gif"></img>

### ✂️ 도전 과제

_**어떻게 아래로 쓸어서 프로필 창을 닫을까?**_
<br/>

```swift
var viewTranslation = CGPoint(x: 0, y: 0)

private func setGesture() {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
}

@objc
func handleDismiss(sender: UIPanGestureRecognizer) {
  switch sender.state {
  case .changed:
          viewTranslation = sender.translation(in: view)
          UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
              self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
          })
  case .ended:
          if viewTranslation.y < 200 {
              UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                  self.view.transform = .identity
              })
          } else {
              dismiss(animated: true, completion: nil)
          }
  default:
          break
  }
}
```

1. 아래로 쓸어서  →  `Down Gesture`가 필요 !
    - `view`에서 제스처를 인식할 수 있도록  `addGestureRecognizer`를 달아주자. <br/>
    → `addGestureRecognizer`는 뷰에서 제스처를 인식할 수 있도록 뷰에 해당 제스처를 달아준다
    - `func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer)` <br/><br/>
2. `UIGestureRecognizer`에 `gesture`를 넣어주자
    - `UIPanGestureRecognizer`는 손가락의 상하좌우로 움직이는 것을 인식하는 것
    - `UIPanGestureRecognizer`를 다루는 함수를 만들자<br/><br/>
3. `UIPanGestureRecognizer`의 state를 사용해서 뷰의 움직임을 구현하자
    - `case .changed:` <br/>
      → 사용자가 뷰를 움직이면, 뷰의 `translation`를 가지고 와서 해당 부분까지 `transform`하게 하는 부분
    - `case .ended:` <br/>
      - 사용자가 뷰를 더이상 움직이지 않을 때(손을 뗐을 때), <br/>
        → **`translation`이 200보다 작으면(뷰를 조금 드래그했을 때)** <br/>
           → `view.transform`이 `identity`(원래 모습)으로 돌아간다 == 밑으로 내려가지 않고 제자리로 돌아온다 <br/>
        → **`translation`이 200 이상이면** <br/>
        → `dismiss`
