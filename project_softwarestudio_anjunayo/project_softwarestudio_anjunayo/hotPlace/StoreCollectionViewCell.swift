//
//  StoreCollectionViewCell.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 21/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var storeInfo: UILabel!
    
    @IBOutlet weak var storeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        storeImg.layer.cornerRadius = 3
        storeImg.layer.masksToBounds = true
        
    }
}
