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
        dvc.modalPresentationStyle = .overCurrentContext
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
        settingButton.addTarget(self, action: #selector(touchUpSetting), for: .touchUpInside)
    }
}

// MARK: - Action
extension FriendListVC {
    @objc
    func touchUpSetting() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let editAction = UIAlertAction(title: "편집", style: .default)
        let friendAction =  UIAlertAction(title: "친구 관리", style: .default, handler: nil)
        let settingAction = UIAlertAction(title: "전체 설정", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(editAction)
        alert.addAction(friendAction)
        alert.addAction(settingAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

// MARK: - Data
extension FriendListVC {
    private func makeData() {
        friendList.append(contentsOf: [
            FriendDataModel(image: "profileImage1", userName: "김솝트", statusMessage: "인생 어렵다"),
            FriendDataModel(image: "profileImage2", userName: "이솝트", statusMessage: "인생 가볍다"),
            FriendDataModel(image: "profileImage3", userName: "심솝트", statusMessage: "인생 중간이다"),
            FriendDataModel(image: "profileImage4", userName: "최솝트", statusMessage: "코딩 어렵다"),
            FriendDataModel(image: "profileImage5", userName: "구솝트", statusMessage: "클라 어렵다"),
            FriendDataModel(image: "profileImage6", userName: "한솝트", statusMessage: "내가 어렵다"),
            FriendDataModel(image: "profileImage7", userName: "손솝트", statusMessage: "인생 많이 어렵다"),
            FriendDataModel(image: "profileImage8", userName: "정솝트", statusMessage: "인생 적게 어렵다"),
            FriendDataModel(image: "profileImage9", userName: "민솝트", statusMessage: "인생 어중간하게 어렵다"),
            FriendDataModel(image: "profileImage10", userName: "박솝트", statusMessage: "인생 적당히 어렵다")
        ])
    }
}
