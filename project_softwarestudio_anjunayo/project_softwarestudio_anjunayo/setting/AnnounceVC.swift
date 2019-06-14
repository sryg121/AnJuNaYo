//
//  AnnounceVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 15/06/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class AnnounceVC: UIViewController, UITableViewDataSource {

    @IBOutlet weak var announceView: UITableView!
    
    var announceList: [Announce] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return announceList.count
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = announceView.dequeueReusableCell(withIdentifier: "announceCell") as! AnnounceCell
        
        let setting = announceList[indexPath.row]
        
        cell.infoLabel.text = setting.items
        cell.dateLabel.text = setting.dates
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAnnounceData()
        
        announceView.dataSource = self

    }


}

extension AnnounceVC {
    func setAnnounceData() {
        let announce1 = Announce(item: "슬기로운 안주나요를 위한 1.0.0 안내")
        let announce2 = Announce(item: "이렇게나 많다니! 업데이트 안내")
        let announce3 = Announce(item: "놓치면 후회할껄? 이번에 추가된 핫플들")
        let announce4 = Announce(item: "안주나요와 함께 해주셔서 감사합니다.")
        
        announceList = [announce1, announce2, announce3, announce4]
    }
}
