//
//  StoreDetailVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 21/05/2019.
//  Edited by 윤세령 on 23/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class StoreDetailVC: UIViewController {
    
    var storeImg: UIImage?
    var storeName: String?
    var storeAdd: String?
    var storeDetail: String?
    var storeFood: [String]?
    
    @IBOutlet weak var storeImgView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeAddressLabel: UILabel!
    @IBOutlet weak var storeDetailLabel: UILabel!
    @IBOutlet weak var storeFoodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContents()
        setStoreImgView()
        
        // Do any additional setup after loading the view.
    }
    
    func setContents(){
        storeImgView.image = storeImg
        storeNameLabel.text = storeName
    }
    
    
    func setStoreImgView(){
        storeImgView.layer.cornerRadius = 5
        storeImgView.layer.masksToBounds = true
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
