//
//  FriendListVC.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import UIKit

class FriendListVC: UIViewController {
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var friendTableView: UITableView!
    
    var friendList: [FriendDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeData()
        setUI()
    }
}

extension FriendListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTVC.identifier) as? UserTVC else {
                return UITableViewCell()
            }
            cell.setData(image: "profileUserImg", userName: "신윤아", status: "안녕하세요. 반가워요")
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTVC.identifier) as? FriendTVC else {
            return UITableViewCell()
        }
        cell.setData(image: friendList[indexPath.row].image, userName: friendList[indexPath.row].userName, status: friendList[indexPath.row].statusMessage)
        return cell
    }
}

extension FriendListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(identifier: "ProfileVC") as? ProfileVC else {
            return
        }
        if indexPath.section == 0 {
            dvc.image = "profileUserImg"
            dvc.name = "신윤아"
        } else {
            dvc.image = friendList[indexPath.row].image
            dvc.name = friendList[indexPath.row].userName
        }
        
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: - UI
extension FriendListVC {
    private func setUI() {
        setTableView()
        setTableViewNib()
        setButton()
    }
    
    private func setTableView() {
        friendTableView.delegate = self
        friendTableView.dataSource = self
        friendTableView.separatorStyle = .none
    }
    
    private func setTableViewNib() {
        let userNib = UINib(nibName: "UserTVC", bundle: nil)
        friendTableView.register(userNib, forCellReuseIdentifier: UserTVC.identifier)
        
        let friendNib = UINib(nibName: "FriendTVC", bundle: nil)
        friendTableView.register(friendNib, forCellReuseIdentifier: FriendTVC.identifier)
    }
    
    private func setButton() {
        settingButton.setImage(UIImage(named: "settingIcon"), for: .normal)
        settingButton.sizeToFit()
    }
}

// MARK: - Data
extension FriendListVC {
    private func makeData() {
        friendList.append(contentsOf: [
            FriendDataModel(image: "profileImage1", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage2", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage3", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage4", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage5", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage6", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage7", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage8", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage9", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage10", userName: "김솝트", statusMessage: "인생 어렵다")
        ])
    }
}
