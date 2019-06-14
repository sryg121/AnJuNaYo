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
    
    // 초기 array
    var recommendList: [Recommend] = []
    // 맑음일 경우 추천해줄 3가지 조합
    var recommendSunny1 : [Recommend] = []
    var recommendSunny2: [Recommend] = []
    var recommendSunny3: [Recommend] = []
    // 흐림 or 구름 많음일 경우 추천해줄 3가지 조합
    var recommendCloudy1: [Recommend] = []
    var recommendCloudy2: [Recommend] = []
    var recommendCloudy3: [Recommend] = []
    // 구름많고 비일 경우 추천해줄 3가지 조합
    var recommendRain1: [Recommend] = []
    var recommendRain2: [Recommend] = []
    var recommendRain3: [Recommend] = []
    // 구름많고 눈일 경우 추천줄 3지 조합
    var recommendSnow1: [Recommend] = []
    var recommendSnow2: [Recommend] = []
    var recommendSnow3: [Recommend] = []
    // 오류 테스트하기 위한 array
    var recommendRand: [Recommend] = []
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setRecommendData()
        
        recommendView.dataSource = self
        recommendView.delegate = self
        
        // set navigation bar title image
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logosample")
        imageView.image = image
        navigationItem.titleView = imageView
 
        // 날씨 정보 나타내기
        WeatherDataSource.shared.fetchSummary(lat: 37.5633, lon: 127.0371){
            [weak self] in
            self?.reloadInputViews()
            self?.listTableView.reloadData()
            self?.recommendView.reloadData()
        }
 
        // 날씨에 따른 안주추천
        // test code: 날씨 정보가 제대로 들어가는지 -> 아무것도 들어가지 않음
        // let weatherData = WeatherDataSource.shared.summary?.weather.minutely.first
        // print(weatherData?.sky.name ?? 0)

        // tableview에서 scroll 못하도록
        self.listTableView.isScrollEnabled = false
        
        recommendView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(gesture:))))
        
    }
    @objc func handleLongPressGesture(gesture: UIGestureRecognizer){
        
        // gesture 가 발생한 좌표를 반환합니다.
        let location = gesture.location(in: self.recommendView)
        
        // 해당 좌표에 recommendView 의 item 이 존재한다면 indexPath 에 해당 item 의 index 를 반환합니다.
        guard let indexPath = recommendView.indexPathForItem(at: location) else {return}
        
        // 해당하는 index 의 model 를 반환합니다.
        let item = recommendList[indexPath.row]
        
        // alert 를 발생하는 메소드입니다.
        let alert = UIAlertController(title: "\(item.recommendTitle)", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { (_) in
            
            // recommendList 배열에서 해당 모델을 제거합니다.
            self.recommendList.remove(at: indexPath.item)
            
            // recommendView 에서 해당하는 index 의 item 을 삭제합니다.
            self.recommendView.deleteItems(at: [indexPath])
        }))
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        // alert 를 화면에 발생시킵니다.
        present(alert, animated: true, completion: nil)
    }
}

extension RecommendVC: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier) as! WeatherTableViewCell
        
        if let data = WeatherDataSource.shared.summary?.weather.minutely.first {
            
            
            //recommendList = recommendSunny2
            
            if data.sky.name == "맑음" {
                
                let num = arc4random_uniform(3)
                
                // test code: 랜덤으로 생성된 수에 맞게 list 들어가는지
                print(num)
                
                if num == UInt32(0) {
                    recommendList = recommendSunny1
                } else if num == UInt32(UInt(1)) {
                    recommendList = recommendSunny2
                } else {
                    recommendList = recommendSunny3
                }
                
            } else if data.sky.name == "흐림" {
                
                let num = arc4random_uniform(3)
                
                if num == UInt32(0) {
                    recommendList = recommendCloudy1
                } else if num == UInt32(UInt(1)) {
                    recommendList = recommendCloudy2
                } else {
                    recommendList = recommendCloudy3
                }
                
            } else if data.sky.name == "구름많고 비"{
                
                let num = arc4random_uniform(3)
                
                if num == UInt32(0) {
                    recommendList = recommendRain1
                } else if num == UInt32(UInt(1)) {
                    recommendList = recommendRain2
                } else {
                    recommendList = recommendRain3
                }
                
            } else if data.sky.name == "구름많고 눈" {
                
                let num = arc4random_uniform(3)
                
                if num == UInt32(0) {
                    recommendList = recommendSnow1
                } else if num == UInt32(UInt(1)) {
                    recommendList = recommendSnow2
                } else {
                    recommendList = recommendSnow3
                }
            } else if data.sky.name == "구름많음" {
                
                let num = arc4random_uniform(3)
                
                print(num)
                
                if num == UInt32(0) {
                    recommendList = recommendCloudy1
                } else if num == UInt32(UInt(1)) {
                    recommendList = recommendCloudy2
                } else {
                    recommendList = recommendCloudy3
                }
                
            } else { // test code : nill 일 경우 확인하기 위해
                
                recommendList = recommendRand
            }
            
            cell.weatherImageView.image = UIImage(named: data.sky.code)
            
            cell.statusLabel.text = data.sky.name
            
            cell.minMaxLabel.text = "최대 \(data.temperature.tmax)º 최소 \(data.temperature.tmin)º"
            
            cell.currentTemperatureLabel.text = "\(data.temperature.tc)º"
            
            
            // test code : 날씨 정보가 제대로 기입되는지 테스트 -> ok
            // print(data.sky.name)
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

// 여기서 이제 recommendView에 나타나는 각 cell 에 해당하는 음식점 리스트를
// RecommendDetailVC에서 collection view에 나타내고 싶은데 어떻게 연결해줘야할지 모르겠습니다.
// 아래는 각 cell을 클릭시 나타낼 음식점 리스트입니다.
/*
 // 추천해준 안주에 해당하는 음식점 리스트 알려주기
 //recommend1:
 menuDetailList = [jeJu, ddangKo]
 //recommend2:
 menuDetailList = [hoChicken, hanSin, againChicken, lifeBeer]
 //recommend3:
 menuDetailList = [dongChon, naGune]
 //recommend4:
 menudDetailList = [bucketList, lightHouse, moonBar,boGoSipDa]
 //recommend5:
 menuDetailList = [goldenDragon, giRi, manLi]
 //recommend6:
 menuDetailList = [yukSha]
 //recommend7:
 menuDetailList = [gobStory, matNa]
 //recommend8:
 menuDetailList = [pomFrites, lifeBeer]
 //recommend9:
 menuDetailList = [jinGook, gaengSaeng, hanSin, boGoSipDa, yukSha]
 //recommend10:
 menuDetailList = [spicyDakBal, yeopGi, hanSin]
 //recommend11:
 menuDetailList = [cloudRain, kyeongSeong, siKi]
 //recommend12:
 menuDetailList = [dieCoZi, manLi, ggoZiPub]
 //recommend13:
 menuDetailList = [noGaRi, hoDoRi]
 //recommend14:
 menuDetailList = [hChong, meJong, gulAndZimLove]
 //recommend15:
 menuDetailList = [eightFT, nakWon]
 */

extension RecommendVC: UICollectionViewDelegate {
    
    /*
     didSelectItemAt 은 셀을 선택했을때 어떤 동작을 할 지 설정할 수 있습니다.
     여기서는 셀을 선택하면 그에 해당하는 RecommendDetailVC 로 화면전환을 합니다.
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "RecommendDetailVC") as! RecommendDetailVC
        
        // 선택된 데이터를 다음 뷰 컨트롤러에 주입
        let selectedRecommend = recommendList[indexPath.item]
        //dvc.selectedRecommendTitle = selectedRecommend.title
        //cell에 있는 데이터들을 여기에 만들어놓은 데이터들로 호출하도록
        print("selected ", selectedRecommend.recommendTitle)
        navigationController?.pushViewController(dvc, animated: true)
        
    }
}

extension RecommendVC{

    func setRecommendData(){
        
        // 안주 종류들
        let recommend1 = Recommend(image: "sf1", title: "삼겹살 + 소주")
        let recommend2 = Recommend(image: "chickenmaek", title: "치킨 + 맥주")
        let recommend3 = Recommend(image: "kimchijeon", title: "김치전 해물파전")
        let recommend4 = Recommend(image: "pasta", title: "파스타 감바스 + 칵테일")
        let recommend5 = Recommend(image: "maratang", title: "중국요리")
        let recommend6 = Recommend(image: "yookhwae", title: "육회")
        let recommend7 = Recommend(image: "gobsso", title: "곱창 + 소주")
        let recommend8 = Recommend(image: "frenchfries", title: "감자튀김 + 맥주")
        let recommend9 = Recommend(image: "eomuktang", title: "탕류")
        let recommend10 = Recommend(image: "dakbal", title: "닭발 + 소주")
        let recommend11 = Recommend(image: "izakaya", title: "이자카야")
        let recommend12 = Recommend(image: "ggochi", title: "꼬치")
        let recommend13 = Recommend(image: "dryanju", title: "마른안주")
        let recommend14 = Recommend(image: "seafood", title: "해물요리")
        let recommend15 = Recommend(image: "pizza2", title: "피자 + 맥주")
        
        // 맑음일 때
        recommendSunny1 = [recommend8, recommend14, recommend6]
        recommendSunny2 = [recommend2, recommend4, recommend12]
        recommendSunny3 = [recommend15, recommend6, recommend13]

        // 흐림 or 구름많음일 때
        recommendCloudy1 = [recommend1, recommend11, recommend3]
        recommendCloudy2 = [recommend7, recommend3, recommend9]
        recommendCloudy3 = [recommend10, recommend9, recommend5]
        
        // 구름많고 비일 때
        recommendRain1 = [recommend3, recommend10, recommend11]
        recommendRain2 = [recommend3, recommend1, recommend9]
        recommendRain3 = [recommend3, recommend7, recommend5]
        
        // 구름많고 눈일 때
        recommendSnow1 = [recommend9, recommend11, recommend6]
        recommendSnow2 = [recommend4, recommend9, recommend6]
        recommendSnow3 = [recommend14, recommend11,recommend9]
        
        // 데이터가 안들어갈 경우 확인하기 위한 recommendRand
        recommendRand = [recommend1, recommend3, recommend7, recommend2]
        
    }
    
}
