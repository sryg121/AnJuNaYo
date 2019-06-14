//
//  SettingVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 21/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class SettingVC: UIViewController, UITableViewDataSource {

    @IBOutlet weak var settingView: UITableView!
    
    var settingList: [Setting] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return settingList.count
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = settingView.dequeueReusableCell(withIdentifier: "SettingCell") as! SettingCell

        let setting = settingList[indexPath.row]

        cell.settingItemLabel.text = setting.items

        return cell

    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setSettingData()
        settingView.dataSource = self

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logosample")
        imageView.image = image
        navigationItem.titleView = imageView
        
        // Do any additional setup after loading the view.
    }

}


extension SettingVC{
    
    func setSettingData(){
        
        let setting1 = Setting(item: "개인/보안")
        let setting2 = Setting(item: "공지사항")
        let setting3 = Setting(item: "앱 정보")
        let setting4 = Setting(item: "약관 및 정책")
        
        settingList = [setting1, setting2, setting3, setting4]
    }
}
