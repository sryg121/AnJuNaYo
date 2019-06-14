//
//  StoreVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 11/06/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class StoreVC: UIViewController {

    // 지도의 버튼을 클릭했을 때 그 버튼에 해당하는 음식점 리스트 보여주기
    @IBAction func flagBtnAction (_ sender: UIButton) {
        switch sender.titleLabel?.text {
            
        case "왕십리 6번 출구":
            break
            
        case "한양시장":
            break
            
        case "사근동":
            break
            
        case "도선동":
            break
            
        case .none:
            break
            
        case .some(_):
            break
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
