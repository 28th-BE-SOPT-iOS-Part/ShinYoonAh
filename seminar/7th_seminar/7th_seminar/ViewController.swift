//
//  ViewController.swift
//  7th_seminar
//
//  Created by SHIN YOON AH on 2021/05/29.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    
    lazy var lottieView : AnimationView = {
        let animationView = AnimationView(name: "7thSeminar_Lottie_sample")
        animationView.frame = CGRect(x: 0, y: 0,
                                     width: 50, height: 50)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        animationView.stop()
        animationView.isHidden = true
    
        
        return animationView
    }()
    
    @IBOutlet weak var sampleTableView: UITableView!
        
    let sampleList : [String] = ["A","B","C","D","E"]
        
    let refreshControl = UIRefreshControl()
        
        
    func initRefresh()
    {
        
        refreshControl.addTarget(self, action: #selector(refreshTable(refresh:)), for:.valueChanged)
        refreshControl.addSubview(lottieView)
        refreshControl.tintColor = .clear
        sampleTableView.refreshControl = refreshControl
    }
        
    @objc func refreshTable(refresh: UIRefreshControl){
        print("새로고침!")
        lottieView.isHidden = false
        lottieView.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.sampleTableView.reloadData()
            self.lottieView.isHidden = true
            self.lottieView.stop()
            refresh.endRefreshing()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(lottieView)
        
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        initRefresh()
    }

    @IBAction func startButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        
    }
}

extension ViewController : UITableViewDelegate
{
    
}


extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sampleCell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else {return UITableViewCell() }
        
        sampleCell.setData(data: sampleList[indexPath.row])
        
        return sampleCell
    }
    
    
}


extension ViewController : UIScrollViewDelegate
{
    
}
