//
//  StoreCollectionVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 21/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class StoreCollectionVC: UIViewController {

    @IBOutlet weak var storeCollection: UICollectionView!
    
    var storeList:[Store] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set navigation bar title image
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logosample")
        imageView.image = image
        navigationItem.titleView = imageView

        
        setStoreData()
        
        storeCollection.dataSource = self
        storeCollection.delegate = self
        
        storeCollection.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(gesture:))))
    }
    
    @objc func handleLongPressGesture(gesture: UIGestureRecognizer){
        
        // gesture 가 발생한 좌표를 반환합니다.
        let location = gesture.location(in: self.storeCollection)
        
        // 해당 좌표에 musicCollection 의 item 이 존재한다면 indexPath 에 해당 item 의 index 를 반환합니다.
        guard let indexPath = storeCollection.indexPathForItem(at: location) else {return}
        
        // 해당하는 index 의 model 를 반환합니다.
        let item = storeList[indexPath.row]
        
        // alert 를 발생하는 메소드입니다.
        let alert = UIAlertController(title: "\(item.storeName) - \(item.storeInfo)", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { (_) in
            
            // musicList 배열에서 해당 모델을 제거합니다.
            self.storeList.remove(at: indexPath.item)
            
            // musicCollection 에서 해당하는 index 의 item 을 삭제합니다.
            self.storeCollection.deleteItems(at: [indexPath])
        }))
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        // alert 를 화면에 발생시킵니다.
        present(alert, animated: true, completion: nil)
    }
    
}
extension StoreCollectionVC: UICollectionViewDataSource {
    
    // UICollectionView 에 얼마나 많은 아이템을 담을 지 설정합니다.
    // 현재는 musicList 배열의 count 갯수 만큼 반환합니다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return storeList.count
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath) as! StoreCollectionViewCell
        
        let store = storeList[indexPath.row]
        
        cell.storeImg.image = store.storeImg
        cell.storeInfo.text = store.storeName
        
        return cell
    }
}
extension StoreCollectionVC: UICollectionViewDelegate {
    
    /*
     didSelectItemAt 은 셀을 선택했을때 어떤 동작을 할 지 설정할 수 있습니다.
     여기서는 셀을 선택하면 그에 해당하는 StoreDetailVC 로 화면전환을 합니다.
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "StoreDetailVC") as! StoreDetailVC
        
        let store = storeList[indexPath.row]
        
        dvc.storeImg = store.storeImg
        dvc.storeName = store.storeName
        dvc.storeInfo = store.storeInfo
        
        navigationController?.pushViewController(dvc, animated: true)
    }
}

extension StoreCollectionVC: UICollectionViewDelegateFlowLayout {
    
    // Collection View Cell 의 windth, height 를 지정할 수 있습니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (view.frame.width - 12)
        let height: CGFloat = (view.frame.width - 45) / 2 + 57
        
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


extension StoreCollectionVC{
    func setStoreData(){
        
        let store1 = Store(storeName: "그림1", name: "조명창고", info: "카시스소다가 정말 맛있어요!")
        let store2 = Store(storeName: "store2", name: "한신포차", info: "닭발에 소주가 최고에요")
        let store3 = Store(storeName: "store3", name: "낙원스낵", info: "날씨 좋을 때는 피맥이죠")
        let store4 = Store(storeName: "store4", name: "백번", info: "한양대 술집하면 백번")
        let store5 = Store(storeName: "store5", name: "한양대신닭발", info: "닭발에 소주가 짱이에요")
        let store6 = Store(storeName: "store6", name: "일번지", info: "일번지는 칵테일 소주")
        let store7 = Store(storeName: "store7", name: "종로빈대떡", info: "빈대떡에 막걸리 한잔")
        let store8 = Store(storeName: "store8", name: "곱창하우스", info: "곱쏘 곱쏘")
        let store9 = Store(storeName: "store9", name: "김부삼", info: "삼겹살에는 소맥 한잔")
        let store10 = Store(storeName: "store10", name: "노란통닭", info: "언제나 최고인 치맥")
        
        storeList = [store1, store2, store3, store4, store5, store6, store7, store8, store9, store10]
    }
}
