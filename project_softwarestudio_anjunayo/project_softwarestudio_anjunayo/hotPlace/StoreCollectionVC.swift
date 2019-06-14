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
    
    //클릭한 위치 표시
    @IBOutlet var locLabel: UILabel!
    
    //왕십리역 6번 출구
    @IBAction func storeLoc1(_ sender: Any) {
        locClickButton = 1
        locLabel.text = "왕십리역 6번 출구"
        storeCollection.reloadData()
    }
    
    //한양시장
    @IBAction func storeLoc2(_ sender: Any) {
        locClickButton = 2
        locLabel.text = "한양시장"
        storeCollection.reloadData()
    }
    
    //사근동
    @IBAction func storeLoc3(_ sender: Any) {
        locClickButton = 3
        locLabel.text = "사근동"
        storeCollection.reloadData()
    }
    
    //도선동
    @IBAction func storeLoc4(_ sender: Any) {
        locClickButton = 4
        locLabel.text = "도선동"
        storeCollection.reloadData()
    }
    
    var storeList:[Store] = []
    var storeWangsimni:[Store] = []
    var storeHanyangMarket:[Store] = []
    var storeSageun:[Store] = []
    var storeDosun:[Store] = []
    
    var locClickButton: Int = 0
    
    
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
        
        switch locClickButton {
        case 0:
            return storeList.count
        case 1:
            return storeWangsimni.count
        case 2:
            return storeHanyangMarket.count
        case 3:
            return storeSageun.count
        case 4:
            return storeDosun.count
        default:
            return storeList.count
        }
        
        
    }
    
    // 각 index 에 해당하는 셀에 데이터를 주입합니다.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath) as! StoreCollectionViewCell
        
        var store = storeList[indexPath.row]
        
        switch locClickButton {
        case 0:
            store = storeList[indexPath.row]
        case 1:
            store = storeWangsimni[indexPath.row]
        case 2:
            store = storeHanyangMarket[indexPath.row]
        case 3:
            store = storeSageun[indexPath.row]
        case 4:
            store = storeDosun[indexPath.row]
        default:
            store = storeList[indexPath.row]
        }
        
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
        
        var store = storeList[indexPath.row]
        
        switch locClickButton {
        case 0:
            store = storeList[indexPath.row]
        case 1:
            store = storeWangsimni[indexPath.row]
        case 2:
            store = storeHanyangMarket[indexPath.row]
        case 3:
            store = storeSageun[indexPath.row]
        case 4:
            store = storeDosun[indexPath.row]
        default:
            store = storeList[indexPath.row]
        }
        
        dvc.storeImg = store.storeImg
        dvc.storeName = "<" + store.storeName + ">"
        dvc.storeInfo = store.storeInfo
        dvc.storeMenu = "☻ " + store.storeMenu
        dvc.storeAddress = "주소: " + store.storeAddress
        
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
        
        //storeList01 : 왕십리역 6번출구
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
        
        //storeList02 : 한양시장
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
        
        //storeList03 : 사근동
        let hoChicken = Store(storeName: "hoChicken", name: "호치킨", address: "성동구 마조로 32", detail: "저렴하게 맛보는 바삭한 크리스피 치킨", recFood: "치슐랭, 크리스피치킨")
        let boGoSipDa = Store(storeName: "boGoSipDa", name: "지금, 보고싶다", address: "성동구 마조로 25 제일빌딩", detail: "밤은 짙고 술은 차고 지금, 보고싶다. 국내 최초 갤러리전 감성주점", recFood: "감바스, 밀푀유나베")
        let againChicken = Store(storeName: "againChicken", name: "다시올치킨", address: "성동구 사근동8길 8", detail: "닭요리 전문점", recFood: "닭칼국수, 순살후라이드")
        let giRi = Store(storeName: "giRi", name: "길이식당", address: "성동구 사근동길 21-1", detail: "성동구를 대표하는 마라탕 맛집", recFood: "마라탕, 마라샹궈, 온면")
        let pomFrites = Store(storeName: "pomFrites", name: "폼프리츠", address: "성동구 사근동길 6", detail: "고소고소한 감자튀김과 시원한 맥주", recFood: "L + 소스2개, 스노우비어")
        let siKi = Store(storeName: "siKi", name: "시키", address: "성동구 사근동길 43", detail: "부담 없이 사케와 일본식 안주를 즐길 수 있는 곳", recFood: "삼겹숙주볶음, 고등어초회")
        let spicyDakBal = Store(storeName: "spicyDakbal", name: "한양대신닭발", address: "성동구 마조로 34", detail: "한양대 대표 닭발집", recFood: "무뼈닭발, 닭알찜, 주먹밥")
        
        //storeList04 : 도선동
        let ddangKo = Store(storeName: "ddangKo", name: "땅코참숯구이", address: "성동구 행당로17길 26", detail: "성동구 고기집 no.1", recFood: "삼겹살, 목살, 물냉면")
        let gulAndZimLove = Store(storeName: "gulAndZimLove", name: "굴과 찜사랑", address: "성동구 행당로17길 23", detail: "해물 덕후들은 모여라! 생방송투데이에도 나온 해물찜 전문점", recFood: "해물찜, 굴국밥, 굴칼국수")
        let lifeBeer = Store(storeName: "lifeBeer", name: "생활맥주", address: "성동구 행당로17길 22-1", detail: "집가는 길 가볍게 맥주 한 잔 어때요?",recFood: "크리스피 텐더와 감자, 생맥주")
        let matNa = Store(storeName: "matNa", name: "맛나곱창", address: "성동구 홍익동 130-1", detail: "왕십리 곱창골목 중에서도 유명한 곱창집", recFood: "소곱창구이")
        let yeopGi = Store(storeName: "yeopGi", name: "엽기꼼닭발", address: "성동구 왕십리로22길 3", detail: "수요미식회에도 나온 닭발과 꼼장어 맛집", recFood: "엽기꼼장어, 뼈없는 닭발")
        
        /*test : collection view 에 해당 내용이 잘 들어가는지 테스트
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
         */
        
        //test code: storeList 제대로 들어가는 확인용
        
        storeWangsimni = [yukSha, eightFt, gaengSaeng, hanSin, hChong, noGaRi, meJong, nakWon, bucketList, dieCoZi]
        storeHanyangMarket = [cloudRain, dongChon, gobStory, goldenDragon, hoDoRi, jinGook, jeJu, kyeongSeong, lightHouse, manLi, moonBar, naGune, ggoZiPub]
        storeSageun = [hoChicken, boGoSipDa, againChicken, giRi, pomFrites, siKi, spicyDakBal]
        storeDosun = [ddangKo, gulAndZimLove, lifeBeer, matNa, yeopGi]
        
        storeList = storeHanyangMarket
    }
}

