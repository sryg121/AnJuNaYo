//
//  ViewController.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 03/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

//날씨 상태 표현하는 string을 return하는 함수


class RecommendVC: UIViewController {

    @IBOutlet weak var recommendView: UICollectionView!
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    var recommendList: [Recommend] = []
    
    var weatherStr: String = ""
    
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
        
        WeatherDataSource.shared.fetchSummary(lat: 37.498206, lon: 127.02761) {
            [weak self] in
            self?.listTableView.reloadData()
            
            
        }
        
        // tableview에서 scroll 못하도록
        self.listTableView.isScrollEnabled = false
        
    }
}

extension RecommendVC: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier) as! WeatherTableViewCell
        
        if let data = WeatherDataSource.shared.summary?.weather.minutely.first {
            
            cell.weatherImageView.image = UIImage(named: data.sky.code)
            
            cell.statusLabel.text = data.sky.name
            
            cell.minMaxLabel.text = "최대 \(data.temperature.tmax)º 최소 \(data.temperature.tmin)º"
            
            cell.currentTemperatureLabel.text = "\(data.temperature.tc)º"

        }
        
        return cell
    }
    
    func numberOfSections(in tableview: UITableView) -> Int {
        return 1
    }
}

extension RecommendVC: UICollectionViewDataSource {
    
    // UICollectionView 에 얼마나 많은 아이템을 담을 지 설정합니다.
    // 현재는 recommendList 배열의 count 갯수 만큼 반환합니다.
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
