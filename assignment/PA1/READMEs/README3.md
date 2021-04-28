## 3주차 구현 영상
<img height="500" src="https://user-images.githubusercontent.com/55099365/116346020-47185c80-a824-11eb-91ff-4eb606087e0d.gif"></img>

### ✂️ 도전 과제

<br/>

_**어떻게 미리 보기 화면을 띄울까?**_
<br/>

[Context Menu를 써보자!](https://developer.apple.com/documentation/uikit/uicontextmenuconfiguration)


### Context Menu

> 해당 메뉴에 대해서 세부 정보를 제공하는 것! -> `Cell`를 꾹 누르면 `Cell`에 대한 세부정보 보여주기

- content Menu는 `init(identifier: NSCopying?, previewProvider: UIContextMenuContentPreviewProvider?, actionProvider: UIContextMenuActionProvider?)`로 Menu 구성을 초기화시켜준다!
  - 순서대로 identifier, 프리뷰로 들어갈 뷰, 프리뷰 밑에 나타나는 메뉴바 이다.

- 이제 순서대로 우리가 원하는걸 넣어주면 된다!

<br/>

```swift
func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider:{
            // ProfileVC를 미리보기로 보여주기 위해서 ProfileVC를 연결하고 그 안에 들어갈 image, name를 section별로 지정
            if let previewViewController =
                    self.storyboard?.instantiateViewController(identifier:"ProfileVC") as? ProfileVC {
                
                if indexPath.section == 0 {
                    previewViewController.image = "profileUserImg"
                    previewViewController.name = "신윤아"
                } else {
                    previewViewController.image = self.friendList[indexPath.row].image
                    previewViewController.name = self.friendList[indexPath.row].userName
                }
                
                return previewViewController
            } else {
                return nil
            }
        }, actionProvider: { suggestedActions in
            // 밑에 연결되는 메뉴바
            let chatAction = UIAction(title: NSLocalizedString("채팅하기", comment: ""), image: UIImage(systemName: "message")) { action in }
            let voiceAction = UIAction(title: NSLocalizedString("보이스톡", comment: ""), image: UIImage(systemName: "phone")) { action in }
            let faceAction = UIAction(title: NSLocalizedString("페이스톡", comment: ""), image: UIImage(systemName: "video")) { action in }
            let giftAction = UIAction(title: NSLocalizedString("선물하기", comment: ""), image: UIImage(systemName: "gift")) { action in }
            
            return UIMenu(title: "", children: [chatAction, voiceAction, faceAction, giftAction])
        })
}
```
