//
//  StoreCell.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 07/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class StoreCell: UITableViewCell {
    
    //StoreTable - StoreCell - ContentView - Store Img
    @IBOutlet var storeImg: UIImageView!
    //StoreTable - StoreCell - ContentView - Store title
    @IBOutlet weak var storeTitle: UILabel!
    
    //객체 초기화
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storeImg.layer.cornerRadius = 3
        storeImg.layer.masksToBounds = true
    }
    
}
