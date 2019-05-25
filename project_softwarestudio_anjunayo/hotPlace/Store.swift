//
//  Store.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 07/05/2019.
//  Edited by 윤세령 on 23/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

//Store 모델 입니다.
//멤버변수로 이미지, 이름, 주소, 설명, 추천메뉴를 받는 Store 구조체를 생성했습니다.
struct Store{
    
    var storeImg: UIImage?
    var storeName: String
    var storeAdd: String?
    var storeDetail: String
    var recFood: [String]?
    
    init(storeName: String, name: String, address: String, detail: String) {
    //, recFood: [String]){
        self.storeImg = UIImage(named: storeName)
        self.storeName = name
        self.storeAdd = address
        self.storeDetail = detail
        //self.recFood = recFood
    }
}
