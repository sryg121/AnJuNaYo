//
//  RecommendData.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 23/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import Foundation
import UIKit

struct Recommend {
    
    var recommendImg: UIImage?
    var recommendTitle: String
    
    init(image: String, title: String){
        self.recommendImg = UIImage(named: image)
        self.recommendTitle = title
    }
    
}
