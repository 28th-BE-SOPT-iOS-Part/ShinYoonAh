//
//  TabbarController.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/11.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
    }
    
    func setTabBar(){
        let myTabbar = self.tabBarController?.tabBar
        UITabBar.appearance().tintColor = UIColor.black
        
        let FriendListStoryboard = UIStoryboard.init(name: "FriendList", bundle: nil)
        let friendTab = FriendListStoryboard.instantiateViewController(identifier: "FriendListVC")
        friendTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        let ChatStoryboard = UIStoryboard.init(name: "Chat", bundle: nil)
        let chatTab = ChatStoryboard.instantiateViewController(identifier: "ChatVC")
        chatTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "message"), selectedImage: UIImage(systemName: "message.fill"))
        
        let InfoStoryboard = UIStoryboard.init(name: "Infomation", bundle: nil)
        let infoTab = InfoStoryboard.instantiateViewController(identifier: "InfoVC")
        infoTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "moon"), selectedImage: UIImage(systemName: "moon.fill"))

        let ShopStoryboard = UIStoryboard.init(name: "Shop", bundle: nil)
        let shopTab = ShopStoryboard.instantiateViewController(identifier: "ShopVC")
        shopTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        
        let SettingStoryboard = UIStoryboard.init(name: "Setting", bundle: nil)
        let settingTab = SettingStoryboard.instantiateViewController(identifier: "SettingVC")
        settingTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "circle.grid.2x2"), selectedImage: UIImage(systemName: "circle.grid.2x2.fill"))

        
        let tabs =  [friendTab, chatTab, infoTab, shopTab, settingTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = friendTab
    }
}
