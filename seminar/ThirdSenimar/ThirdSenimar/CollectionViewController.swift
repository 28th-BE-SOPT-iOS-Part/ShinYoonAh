//
//  CollectionViewController.swift
//  ThirdSenimar
//
//  Created by SHIN YOON AH on 2021/04/24.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var serviceList: [DataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        setMusicList()
    }
    
    func setMusicList()
    {
        serviceList.append(contentsOf: [
            DataModel(iconImageName: "musicAlbum1",
                      title: "가습기",
                      subtitle: "한요한"),
            
            DataModel(iconImageName: "musicAlbum2",
                      title: "Thick and Thin",
                      subtitle: "LANY"),
            
            DataModel(iconImageName: "musicAlbum3",
                      title: "시공간",
                      subtitle: "기리보이"),
            
            DataModel(iconImageName: "musicAlbum4",
                      title: "NISEKOI",
                      subtitle: "Futuristic Swaver")
        ])
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return serviceList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setData(image: serviceList[indexPath.row].iconImageName, title: serviceList[indexPath.row].title, subtitle: serviceList[indexPath.row].subtitle)
        return cell
    }
}

extension CollectionViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (177/375)
        let cellHeight = cellWidth * (205/177)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 28, left: 9, bottom: 28, right: 9)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }

}
