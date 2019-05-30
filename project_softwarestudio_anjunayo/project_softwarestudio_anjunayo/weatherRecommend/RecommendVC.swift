//
//  ViewController.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 03/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

//날씨 상태 표현하는 string을 return하는 함수
func findWeather() -> String {
    var weatherCode: Int = 100
    var weatherStatus: String = ""
    let url = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=728cdb1629d7ea4c4c04235e81643675"
    let apiURL: URL! = URL(string: url)
    
    let apidata = try! Data(contentsOf: apiURL)
    do{
        let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
        let weatherArray = apiDictionary["weather"] as! NSArray
        let weatherDictionary = weatherArray[0] as! NSDictionary
        if let weatherID = weatherDictionary["id"] as? Int {
            weatherCode = weatherID
        } else {
            print("error")
        }
    } catch {
        print("error")
    }
    
    //        200 - 232 번개
    //        300 - 531 비
    //        600 - 622 눈
    //        700, 721,741 안개
    //        711 스모크
    //        733 751 761 먼지 심함
    //        762 화산재
    //        771 돌풍
    //        781 토네이도
    //        800 맑음
    //        801 - 804 흐림
    
    if weatherCode >= 200, weatherCode <= 232 {
        weatherStatus = "번개"
    }else if weatherCode >= 300, weatherCode <= 531 {
        weatherStatus = "비"
    }else if weatherCode >= 600, weatherCode <= 622 {
        weatherStatus = "눈"
    }else if weatherCode == 700 || weatherCode == 721 || weatherCode==741 {
        weatherStatus = "안개"
    }else if weatherCode == 711 {
        weatherStatus = "스모크"
    }else if weatherCode == 733 || weatherCode == 751 || weatherCode == 761 {
        weatherStatus = "먼지 심함"
    }else if weatherCode == 762 {
        weatherStatus = "화산재"
    }else if weatherCode == 771 {
        weatherStatus = "돌풍"
    }else if weatherCode == 781 {
        weatherStatus = "토네이도"
    }else if weatherCode == 800 {
        weatherStatus = "맑음"
    }else if weatherCode >= 801, weatherCode <= 804 {
        weatherStatus = "흐림"
    }
    
    return weatherStatus
    
}

class RecommendVC: UIViewController {

    @IBOutlet weak var recommendView: UICollectionView!
    
    @IBOutlet weak var weatherView: UITableView!
    
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
