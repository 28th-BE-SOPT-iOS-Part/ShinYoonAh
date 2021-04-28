//
//  SettingVC.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/04/13.
//

import UIKit

class SettingVC: UIViewController {
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    var menus: [String] = ["메일", "캘린더", "서랍", "카카오콘", "메이커스", "선물하기", "이모티콘", "프렌즈", "쇼핑하기", "스타일", "주문하기", "멜론티켓", "게임", "멜론", "헤어샵", "전체서비스"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension SettingVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCVC.identifier, for: indexPath) as? MenuCVC else {
            return UICollectionViewCell()
        }
        cell.setLabel(menu: menus[indexPath.row])
        return cell
    }
}

extension SettingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width - (19 * 5)) / 4
        return CGSize(width: width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 19, left: 19, bottom: 19, right: 19)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
    }
}

// MARK: - UI
extension SettingVC {
    private func setUI() {
        setCollectionView()
        setCollectionViewNib()
        setLabel()
        setView()
        setButton()
    }
    
    private func setCollectionView() {
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
    }
    
    private func setCollectionViewNib() {
        let nib = UINib(nibName: "MenuCVC", bundle: nil)
        menuCollectionView.register(nib, forCellWithReuseIdentifier: MenuCVC.identifier)
    }
    
    private func setLabel() {
        userNameLabel.text = "신윤아"
        
        statusLabel.text = "yxxnaxxin@insta.com"
        statusLabel.textColor = .kakaoGray
    }
    
    private func setView() {
        bottomView.backgroundColor = .kakaoLightGray
    }
    
    private func setButton() {
        settingButton.setImage(UIImage(named: "settingIcon"), for: .normal)
        settingButton.sizeToFit()
        settingButton.tintColor = .black
    }
}
