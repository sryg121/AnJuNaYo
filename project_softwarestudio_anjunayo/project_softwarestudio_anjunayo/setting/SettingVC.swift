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
        settingView.delegate = self

        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logosample")
        imageView.image = image
        navigationItem.titleView = imageView

    }
    
    /*
     didSelectRowAt 함수에서 해당 셀을 선택하고 설정 상세정보 뷰로 전환되었다가 다시 돌아오면
     그 셀이 선택된 상태로 남아 있는 현상을 해결.
     */
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        if let index = settingView.indexPathForSelectedRow {
            settingView.deselectRow(at: index, animated: true)
        }
    }

}

extension SettingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let ivc = storyboard?.instantiateViewController(withIdentifier: "InfoVC") as! InfoVC
            navigationController?.pushViewController(ivc, animated: true)
        }
        if indexPath.row == 3 {
            let tvc = storyboard?.instantiateViewController(withIdentifier: "TermVC") as! TermVC
            navigationController?.pushViewController(tvc, animated: true)
        }
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
