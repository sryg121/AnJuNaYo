//
//  ViewController.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 03/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class RecommendVC: UIViewController {

    @IBOutlet weak var recommendView: UICollectionView!
    
    @IBOutlet weak var weatherView: UITableView!
    
    var recommendList: [Recommend] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setRecommendData()
        
        recommendView.dataSource = self
        
        // set navigation bar title image
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logosample")
        imageView.image = image
        navigationItem.titleView = imageView
        
    }
}
extension RecommendVC: UICollectionViewDataSource {
    
    // UICollectionView 에 얼마나 많은 아이템을 담을 지 설정합니다.
    // 현재는 musicList 배열의 count 갯수 만큼 반환합니다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return recommendList.count
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as! RecommendCollectionViewCell
        
        let recommend = recommendList[indexPath.row]
        
        cell.recommendImg.image = recommend.recommendImg
        cell.recommendTitle.text = recommend.recommendTitle
        
        return cell
    }
}

extension RecommendVC{
    func setRecommendData(){
        
        let recommend1 = Recommend(image: "sf1", title: "삼겹살 + 소주")
        let recommend2 = Recommend(image: "sf1", title: "치킨 + 맥주")
        let recommend3 = Recommend(image: "sf1", title: "부침개 + 막걸리")
        
        recommendList = [recommend1, recommend2, recommend3]
    }
}
