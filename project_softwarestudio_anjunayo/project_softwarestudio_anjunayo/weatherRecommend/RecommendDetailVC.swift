//
//  RecommendDetailVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 23/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class RecommendDetailVC: UIViewController {
    
    @IBOutlet weak var detailView: UICollectionView!
    
    var menuDetailList: [Store] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailView.dataSource = self
        detailView.delegate = self
        // Do any additional setup after loading the view.
    }
    
}

extension RecommendDetailVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuDetailList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendDetailViewCell", for: indexPath) as! RecommendDetailViewCell
        
        let store = menuDetailList[indexPath.row]

        
        cell.detailImage.image = store.storeImg
        cell.detailLabel.text = store.storeName
        cell.detailInfo.text = store.storeInfo
        
        
        return cell
    }
    
    
}

extension RecommendDetailVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "StoreDetailVC") as! StoreDetailVC
        
        let data = menuDetailList[indexPath.row]
        
        dvc.storeAddress = "주소: " + data.storeAddress
        dvc.storeImg = data.storeImg
        dvc.storeInfo = "'" + data.storeInfo + "'"
        dvc.storeName = "<" + data.storeName + ">"
        dvc.storeMenu = "☺︎ " + data.storeMenu

        navigationController?.pushViewController(dvc, animated: true)
        
    }
}

extension RecommendDetailVC: UICollectionViewDelegateFlowLayout {
    
    // Collection View Cell 의 windth, height 를 지정할 수 있습니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (view.frame.width - 45)
        let height: CGFloat = (view.frame.width - 45) + 57
        
        return CGSize(width: width, height: height)
    }
    
    // minimumLineSpacingForSectionAt 은 수직 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 15
    }
    
    // minimumInteritemSpacingForSectionAt 은 수평 방향에서의 Spacing 을 의미합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    // insetForSectionAt 섹션 내부 여백을 말합니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    }
}

