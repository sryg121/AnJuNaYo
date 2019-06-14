//
//  RecommendDetailViewCell.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 13/06/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class RecommendDetailViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var detailInfo: UILabel!
    
    
    override func awakeFromNib() {
        detailImage.layer.cornerRadius = 10
        detailImage.layer.masksToBounds = true
    }
}
