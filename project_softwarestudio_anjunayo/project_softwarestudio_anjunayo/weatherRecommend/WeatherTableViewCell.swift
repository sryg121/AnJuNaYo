//
//  WeatherTableViewCell.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 24/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    static let identifier = "WeatherTableViewCell"
    
    @IBOutlet weak var weatherImgView: UIImageView!
    
    @IBOutlet weak var minMaxLable: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
