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
    
    // 초기 array
    var store: [Store] = []
    //recommend1:
    var storePork: [Store] = []
    //recommend2:
    var storeChicken: [Store] = []
    //recommend3:
    var storeJeon: [Store] = []
    //recommend4:
    var storeCocktail: [Store] = []
    //recommend5:
    var storeChinese: [Store] = []
    //recommend6:
    var storeYookhwae: [Store] = []
    //recommend7:
    var storeGob:[Store] = []
    //recommend8:
    var storeFrenchfry: [Store] = []
    //recommend9:
    var storeTang: [Store] = []
    //recommend10:
    var storeDakbal: [Store] = []
    //recommend11:
    var storeIzakaya: [Store] = []
    //recommend12:
    var storeGgochi: [Store] = []
    //recommend13:
    var storeDry: [Store] = []
    //recommend14:
    var storeSeafood: [Store] = []
    //recommend15:
    var storePizza: [Store] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setRecommendData()
        setStoreData()
        
        recommendView.dataSource = self
        recommendView.delegate = self
        
        // set navigation bar title image
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logoType")
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

extension RecommendVC: UICollectionViewDelegate {
    
    /*
     didSelectItemAt 은 셀을 선택했을때 어떤 동작을 할 지 설정할 수 있습니다.
     여기서는 셀을 선택하면 그에 해당하는 RecommendDetailVC 로 화면전환을 합니다.
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let dvc = storyboard?.instantiateViewController(withIdentifier: "RecommendDetailVC") as! RecommendDetailVC
        
        // 선택된 데이터를 다음 뷰 컨트롤러(RecommendDetailVC) 에 주입
        let selectedRecommend = recommendList[indexPath.item]
        
        //cell에 있는 데이터들을 여기에 만들어놓은 데이터들로 호출하도록
        if selectedRecommend.recommendTitle == "삼겹살 + 소주" {
            dvc.menuDetailList = storePork
        } else if selectedRecommend.recommendTitle == "치킨 + 맥주" {
            dvc.menuDetailList = storeChicken
        } else if selectedRecommend.recommendTitle == "김치전 해물파전"{
            dvc.menuDetailList = storeJeon
        } else if selectedRecommend.recommendTitle == "파스타 감바스 + 칵테일" {
            dvc.menuDetailList = storeCocktail
        } else if selectedRecommend.recommendTitle == "중국요리" {
            dvc.menuDetailList = storeChinese
        } else if selectedRecommend.recommendTitle == "육회" {
            dvc.menuDetailList = storeYookhwae
        } else if selectedRecommend.recommendTitle == "곱창 + 소주" {
            dvc.menuDetailList = storeGob
        } else if selectedRecommend.recommendTitle == "감자튀김 + 맥주" {
            dvc.menuDetailList = storeFrenchfry
        } else if selectedRecommend.recommendTitle == "탕류" {
            dvc.menuDetailList = storeTang
        } else if selectedRecommend.recommendTitle == "닭발 + 소주" {
            dvc.menuDetailList = storeDakbal
        } else if selectedRecommend.recommendTitle == "이자카야" {
            dvc.menuDetailList = storeIzakaya
        } else if selectedRecommend.recommendTitle == "꼬치" {
            dvc.menuDetailList = storeGgochi
        } else if selectedRecommend.recommendTitle == "마른안주" {
            dvc.menuDetailList = storeDry
        } else if selectedRecommend.recommendTitle == "해물요리" {
            dvc.menuDetailList = storeSeafood
        } else if selectedRecommend.recommendTitle == "피자 + 맥주" {
            dvc.menuDetailList = storePizza
        } else { // test code: 데이터가 아무것도 안들어가는 경우 테스트 위한 예외코드
            dvc.menuDetailList = store
        }
        
        print("selected ", selectedRecommend.recommendTitle)
        navigationController?.pushViewController(dvc, animated: true)
        
    }
}

extension RecommendVC{

    //안주조합 추천 메소드
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
    
    //조합 별 음식점 설정 메소드
    func setStoreData(){
        
        // 음식점 종류
        let yukSha = Store(storeName:"yukSha", name: "육앤샤", address: "성동구 마조로5길 5", detail: "육회와 샤브샤브의 조화", recFood: "육회+샤브, 육회비빔밥, 육사시미")
        let eightFt = Store(storeName:"eightFt", name: "8피트", address: "성동구 마조로1길 39", detail: "시원한 루프탑 바에서 맥주 한 잔", recFood: "피자, 플래터, 감바스")
        let gaengSaeng = Store(storeName: "gaengSaeng", name: "갱생", address: "성동구 마조로7길 5", detail: "착하게 삽시다", recFood: "로제파스탕, 명란크림파스탕, 옥수수콘")
        let hanSin = Store(storeName: "hanSin", name: "한신포차", address: "성동구 마조로5길 12-1", detail: "메뉴 성공률 100%", recFood: "국물닭발, 주먹밥, 계란말이")
        let hChong = Store(storeName:"hChong", name: "회뜨는 총각", address: "성동구 마조로5길 4-12", detail: "한양대가 본점이라는 사실, 알고 계셨나요?", recFood: "모듬 회")
        let noGaRi = Store(storeName: "noGaRi", name: "노가리슈퍼", address: "성동구 행당로17길 21", detail: "왕십리 가성비 술집", recFood: "짝태, 닭치기한상후라이드")
        let meJong = Store(storeName: "meJong", name: "메종드 혁이네", address: "성동구 마조로3나길 27", detail: "만석일 땐 불이 들어와요", recFood: "바지락술찜, 삼치구이")
        let nakWon = Store(storeName: "nakWon", name: "낙원스낵", address: "성동구 마조로5길 14", detail: "간단하게 피맥", recFood: "베이컨치즈피자, 마약옥수수")
        let bucketList = Store(storeName: "bucketList", name: "버킷리스트", address: "성동구 마조로7길 13", detail: "분위기 좋은 칵테일 바", recFood: "라임 모히또")
        let dieCoZi = Store(storeName: "dieCoZi", name: "다이꼬지", address: "성동구 마조로3나길 26", detail: "한양대 인근 이자카야", recFood: "통오징어그릴, 생연어회")
        let cloudRain = Store(storeName: "cloudRain", name: "운우", address: "성동구 행당동 158-53", detail: "혼술하기 좋은 곳", recFood: "통삼겹조림, 보리소주")
        let dongChon = Store(storeName: "dongChon", name: "동촌", address: "성동구 행당1동 158-58", detail: "밤막걸리가 맛있는 곳", recFood: "김치전, 알밤막걸리")
        let gobStory = Store(storeName: "gobStory", name: "곱창이야기", address: "성동구 마조로5길 3", detail: "소곱창과 가래떡의 조합", recFood: "한우곱창모듬")
        let goldenDragon = Store(storeName: "goldenDragon", name: "금룡", address: "성동구 마조로 17 한양시장", detail: "24시간 중국집, 배달도 됩니다",recFood: "세트메뉴, 삼선짬뽕")
        let hoDoRi = Store(storeName: "hoDoRi", name: "호돌이전파사", address: "성동구 마조로3길 10", detail: "인생은 황태를 먹기 전과 후로 나뉜다", recFood: "황태, 촉촉오징어")
        let jinGook = Store(storeName: "jinGook", name: "진국", address: "성동구 마조로 7", detail: "24시간 해장국 맛집", recFood: "국밥, 물냉면")
        let jeJu = Store(storeName: "jeJu", name: "제주뒷고기", address: "성동구 마조로 17 한양시장", detail: "뒷고기 한 점과 한라산의 조화", recFood: "뒷고기, 고기국수")
        let kyeongSeong = Store(storeName: "kyeongSeong", name: "경성주막1929", address: "성동구 마조로 11", detail: "가성비 좋은 퓨전이자카야", recFood: "오코노미야키, 나베")
        let lightHouse = Store(storeName: "lightHouse", name: "조명창고", address: "성동구 마조로 22-3", detail: "소개팅과 데이트, 모임에 적합한 분위기 좋은 술집", recFood: "매콤크림파스타, 갈릭새우크림파스타")
        let manLi = Store(storeName: "manLi", name: "만리향 양꼬치", address: "성동구 마조로5길 3-3", detail: "한양대 대표 양꼬치 집", recFood: "꿔바로우, 양꼬치")
        let moonBar = Store(storeName: "moonBar", name: "달바", address: "성동구 마조로3가길 21", detail: "분위기 좋은 곳에서 칵테일 한 잔", recFood: "칵테일")
        let naGune = Store(storeName:"naGuNe", name: "나그네파전", address: "성동구 마조로1길 4", detail: "동동주와 파전이 맛있는, 비가 오면 떠오르는 곳", recFood: "파전, 찹쌀동동주")
        let ggoZiPub = Store(storeName: "ggoZiPub", name: "꼬지펍", address: "성동구 마조로 17", detail: "직화구이 꼬치가 맛있는 왕십리 술집", recFood: "삼겹살꼬지, 파닭꼬지")
        let hoChicken = Store(storeName: "hoChicken", name: "호치킨", address: "성동구 마조로 32", detail: "저렴하게 맛보는 바삭한 크리스피 치킨", recFood: "치슐랭, 크리스피치킨")
        let boGoSipDa = Store(storeName: "boGoSipDa", name: "지금, 보고싶다", address: "성동구 마조로 25 제일빌딩", detail: "밤은 짙고 술은 차고 지금, 보고싶다. 국내 최초 갤러리전 감성주점", recFood: "감바스, 밀푀유나베")
        let againChicken = Store(storeName: "againChicken", name: "다시올치킨", address: "성동구 사근동8길 8", detail: "닭요리 전문점", recFood: "닭칼국수, 순살후라이드")
        let giRi = Store(storeName: "giRi", name: "길이식당", address: "성동구 사근동길 21-1", detail: "성동구를 대표하는 마라탕 맛집", recFood: "마라탕, 마라샹궈, 온면")
        let pomFrites = Store(storeName: "pomFrites", name: "폼프리츠", address: "성동구 사근동길 6", detail: "고소고소한 감자튀김과 시원한 맥주", recFood: "L + 소스2개, 스노우비어")
        let siKi = Store(storeName: "siKi", name: "시키", address: "성동구 사근동길 43", detail: "부담 없이 사케와 일본식 안주를 즐길 수 있는 곳", recFood: "삼겹숙주볶음, 고등어초회")
        let spicyDakBal = Store(storeName: "spicyDakbal", name: "한양대신닭발", address: "성동구 마조로 34", detail: "한양대 대표 닭발집", recFood: "무뼈닭발, 닭알찜, 주먹밥")
        let ddangKo = Store(storeName: "ddangKo", name: "땅코참숯구이", address: "성동구 행당로17길 26", detail: "성동구 고기집 no.1", recFood: "삼겹살, 목살, 물냉면")
        let gulAndZimLove = Store(storeName: "gulAndZimLove", name: "굴과 찜사랑", address: "성동구 행당로17길 23", detail: "해물 덕후들은 모여라! 생방송투데이에도 나온 해물찜 전문점", recFood: "해물찜, 굴국밥, 굴칼국수")
        let lifeBeer = Store(storeName: "lifeBeer", name: "생활맥주", address: "성동구 행당로17길 22-1", detail: "집가는 길 가볍게 맥주 한 잔 어때요?",recFood: "크리스피 텐더와 감자, 생맥주")
        let matNa = Store(storeName: "matNa", name: "맛나곱창", address: "성동구 홍익동 130-1", detail: "왕십리 곱창골목 중에서도 유명한 곱창집", recFood: "소곱창구이")
        let yeopGi = Store(storeName: "yeopGi", name: "엽기꼼닭발", address: "성동구 왕십리로22길 3", detail: "수요미식회에도 나온 닭발과 꼼장어 맛집", recFood: "엽기꼼장어, 뼈없는 닭발")
        
        //메뉴 별 음식점 list
        storePork = [jeJu, ddangKo]
        storeChicken = [hoChicken, hanSin, againChicken, lifeBeer]
        storeJeon = [dongChon, naGune]
        storeCocktail = [bucketList, lightHouse, moonBar,boGoSipDa]
        storeChinese = [goldenDragon, giRi, manLi]
        storeYookhwae = [yukSha]
        storeGob = [gobStory, matNa]
        storeFrenchfry = [pomFrites, lifeBeer]
        storeTang = [jinGook, gaengSaeng, hanSin, boGoSipDa, yukSha]
        storeDakbal = [spicyDakBal, hanSin, yeopGi]
        storeIzakaya = [cloudRain, kyeongSeong, siKi]
        storeGgochi = [dieCoZi, manLi, ggoZiPub]
        storeDry = [noGaRi, hoDoRi]
        storeSeafood = [hChong, meJong, gulAndZimLove]
        storePizza = [eightFt, nakWon]
        
    }
}
