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
    
    var loc: String = "지역"
    
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
        let image = UIImage(named: "logoType")
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
        if indexPath.row == 0 {
            let pvc = storyboard?.instantiateViewController(withIdentifier: "PrivacyVC") as! PrivacyVC
            navigationController?.pushViewController(pvc, animated: true)
        } else if indexPath.row == 2 {
            let ivc = storyboard?.instantiateViewController(withIdentifier: "InfoVC") as! InfoVC
            navigationController?.pushViewController(ivc, animated: true)
        } else if indexPath.row == 3 {
            let tvc = storyboard?.instantiateViewController(withIdentifier: "TermVC") as! TermVC
            navigationController?.pushViewController(tvc, animated: true)
        } else if indexPath.row == 1 {
            let avc = storyboard?.instantiateViewController(withIdentifier: "AnnounceVC") as! AnnounceVC
            navigationController?.pushViewController(avc, animated: true)
        } else {
            let loc = "지역"
            performSegue(withIdentifier: "toLoc", sender: loc)            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLoc" {
            let vc = segue.destination as! LocVC
            
        }
    }
    
    @IBAction func toBase(segue: UIStoryboardSegue){
        
    }
}


extension SettingVC{
    
    func setSettingData(){
        
        let setting1 = Setting(item: "고객지원 및 보안")
        let setting2 = Setting(item: "공지사항")
        let setting3 = Setting(item: "앱 정보")
        let setting4 = Setting(item: "약관 및 정책")
        let setting5 = Setting(item: "지역 설정")
        
        settingList = [setting1, setting2, setting3, setting4, setting5]
    }
}
