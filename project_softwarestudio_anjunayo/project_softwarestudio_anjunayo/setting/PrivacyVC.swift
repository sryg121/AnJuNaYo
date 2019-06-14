//
//  PrivacyVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 15/06/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class PrivacyVC: UIViewController, UITableViewDataSource {

    @IBOutlet weak var privacyView: UITableView!
    
    var privacyList: [Setting] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return privacyList.count
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = privacyView.dequeueReusableCell(withIdentifier: "privacyCell") as! PrivacyCell
        
        let setting = privacyList[indexPath.row]

        cell.item.text = setting.items
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPrivacyData()
        privacyView.dataSource = self
    }

}
extension PrivacyVC{
    
    func setPrivacyData(){
        
        let setting1 = Setting(item: "개인정보취급방침")
        let setting2 = Setting(item: "어플 더 보기")
        let setting3 = Setting(item: "오픈 소스 라이센스")
        
        privacyList = [setting1, setting2, setting3]
    }
}
