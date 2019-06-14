//
//  StoreDetailVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 21/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class StoreDetailVC: UIViewController {
    
    var storeImg: UIImage?
    var storeName: String?
    var storeInfo: String?
    var storeAddress: String?
    var storeMenu: String?
    
    @IBOutlet weak var storeImgView: UIImageView!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    
    @IBOutlet weak var storeInfoLabel: UILabel!
    
    @IBOutlet weak var storeRecFoodLabel: UILabel!
    
    @IBOutlet weak var storeAddressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()
        setStoreImgView()
        setFont()

    }
    
    // font 설정하는 함수
    func setFont(){
        self.storeNameLabel.font = UIFont(name: "NanumSquareOTFR", size: 20)
    }

    func setContents(){
        storeImgView.image = storeImg
        storeInfoLabel.text = storeInfo
        storeNameLabel.text = storeName
        storeAddressLabel.text = storeAddress
        storeRecFoodLabel.text = storeMenu
    }
    
    func setStoreImgView(){
        storeImgView.layer.cornerRadius = 5
        storeImgView.layer.masksToBounds = true
    }

}
