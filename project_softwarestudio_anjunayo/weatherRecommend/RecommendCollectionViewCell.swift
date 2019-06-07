//
//  RecommendCollectionViewCell.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 23/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recommendImg: UIImageView!
    
    @IBOutlet weak var recommendTitle: UILabel!
    
    override func awakeFromNib() {
        
        recommendImg.layer.cornerRadius = 10
        recommendImg.layer.masksToBounds = true
        
    }
}
