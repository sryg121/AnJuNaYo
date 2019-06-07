//
//  Store.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 07/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

//Store 모델 입니다.
//멤버변수가 총 2개인 Store 구조체를 생성했습니다.
struct Store{
    
    var storeImg: UIImage?
    var storeName: String
    
    init(storeName: String, name: String){
        self.storeImg = UIImage(named: storeName)
        self.storeName = name
    }
}
