//
//  StoreListVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 07/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class StoreListVC: UIViewController, UITableViewDataSource {
    
    //UITableView의 outlet 변수
    @IBOutlet weak var storeTable: UITableView!
    //UITableView 에 들어가게 될 Store 모델 타입의 배열을 생성합니다.
    //Store 모델은 Store.swift 에 생성되어있습니다.
    var storeList: [Store] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return storeList.count
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = storeTable.dequeueReusableCell(withIdentifier: "StoreCell") as! StoreCell
        
        let store = storeList[indexPath.row]
        
        cell.storeImg.image = store.storeImg
        cell.storeTitle.text = store.storeName
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStoreData()
        storeTable.dataSource = self
        // Do any additional setup after loading the view.
    }
}

//임의로 model 에 직접 데이터를 넣어주는 작업
//서버를 통해서 받을 때에는 이곳에서 데이터를 받아서 모델에 할당
extension StoreListVC {
    
        func setStoreData() {
            
            let store1 = Store(storeName: "store1", name: "조명창고")
            let store2 = Store(storeName: "store2", name: "한신포차")
            let store3 = Store(storeName: "store3", name: "낙원스낵")
            let store4 = Store(storeName: "store4", name: "백번")
            let store5 = Store(storeName: "store5", name: "한양대신닭발")
            let store6 = Store(storeName: "store6", name: "일번지")
            let store7 = Store(storeName: "store7", name: "종로빈대떡")
            let store8 = Store(storeName: "store8", name: "곱창하우스")
            let store9 = Store(storeName: "store9", name: "김부삼")
            let store10 = Store(storeName: "store10", name: "노란통닭")
        
            storeList = [store1, store2, store3, store4, store5, store6, store7, store8, store9, store10]
        }
}

