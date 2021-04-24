//
//  TableViewController.swift
//  ThirdSenimar
//
//  Created by SHIN YOON AH on 2021/04/24.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var serviceList: [DataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setServiceData()
    }

    func setServiceData() {
        serviceList.append(contentsOf: [
            DataModel(iconImageName: "soptAppIcon1",
                                 title: "OUNCE - 집사를 위한 똑똑한 기록장",
                                 subtitle: "우리 고양이의 까다로운 입맛 정리 서비스"),
            
            DataModel(iconImageName: "soptAppIcon2",
                                 title: "포켓유니브",
                                 subtitle: "MZ세대를 위한, 올인원 대학생활 관리 플랫폼"),
            
            DataModel(iconImageName: "soptAppIcon3",
                                 title: "MOMO",
                                 subtitle: "책 속의 문장과 함께 쓰는 일기"),
            
           DataModel(iconImageName: "soptAppIcon4",
                                 title: "Weathy(웨디)",
                                 subtitle: "나에게 돌아오는 맞춤 날씨 서비스"),
            
            DataModel(iconImageName: "soptAppIcon5",
                                 title: "BeMe",
                                 subtitle: "나를 알아가는 질문 다이어리"),
            
            DataModel(iconImageName: "soptAppIcon6",
                                 title: "placepic",
                                 subtitle: "우리들끼리 공유하는 최애장소, 플레이스픽"),
            
            DataModel(iconImageName: "soptAppIcon7",
                                 title: "몽글(Mongle)",
                                 subtitle: "우리가 만드는 문장 큐레이션 플랫폼, 몽글")
        ])
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.setData(image: serviceList[indexPath.row].iconImageName, title: serviceList[indexPath.row].title, subtitle: serviceList[indexPath.row].subtitle)
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
}
