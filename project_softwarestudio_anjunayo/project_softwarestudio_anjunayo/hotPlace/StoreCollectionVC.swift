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
        
        //storeList01 : 왕십리역 6번출구
        let yukSha = Store(storeName:"yukSha", name: "육앤샤", info: "육회와 샤브샤브의 조화")
        let eightFt = Store(storeName:"eightFt", name: "8피트", info: "시원한 루프탑 바에서 맥주 한 잔")
        let gaengSaeng = Store(storeName: "gaengSaeng", name: "갱생", info: "교도소 컨셉의 복고 술집")
        let hanSin = Store(storeName: "hanSin", name: "한신포차", info: "메뉴 성공률 100%")
        let hChong = Store(storeName:"hChong", name: "회뜨는 총각", info: "한양대가 본점이라는 사실, 알고 계셨나요?")
        let noGaRi = Store(storeName: "noGaRi", name: "노가리슈퍼", info:  "왕십리 가성비 술집")
        let meJong = Store(storeName: "meJong", name: "메종드 혁이네", info: "만석일 땐 불이 들어와요")
        let nakWon = Store(storeName: "nakWon", name: "낙원스낵", info: "간단하게 피맥")
        let bucketList = Store(storeName: "bucketList", name: "버킷리스트", info: "분위기 좋은 칵테일 바")
        let dieCoZi = Store(storeName: "dieCoZi", name: "다이꼬지", info: "한양대 인근 이자카야")
        
        //storeList02 : 한양시장
        let cloudRain = Store(storeName: "cloudRain", name: "운우", info: "혼술하기 좋은 곳")
        let dongChon = Store(storeName: "dongChon", name: "동촌", info: "밤막걸리가 맛있는 곳")
        let gobStory = Store(storeName: "gobStory", name: "곱창이야기", info: "소곱창과 가래떡의 조합")
        let goldenDragon = Store(storeName: "goldenDragon", name: "금룡", info: "24시간 중국집, 배달도 됩니다")
        let hoDoRi = Store(storeName: "hoDoRi", name: "호돌이전파사", info: "인생은 황태를 먹기 전과 후로 나뉜다")
        let jinGook = Store(storeName: "jinGook", name: "진국", info: "24시간 해장국 맛집")
        let jeJu = Store(storeName: "jeJu", name: "제주뒷고기", info: "뒷고기 한 점과 한라산의 조화")
        let kyeongSeong = Store(storeName: "kyeongSeong", name: "경성주막1929", info: "가성비 좋은 퓨전 이자카야")
        let lightHouse = Store(storeName: "lightHouse", name: "조명창고", info: "소개팅과 데이트, 모임에 적합한 분위기 좋은 술집")
        let manLi = Store(storeName: "manLi", name: "만리향 양꼬치", info: "한양대 대표 양꼬치 집")
        let moonBar = Store(storeName: "moonBar", name: "달바", info: "분위기 좋은 곳에서 칵테일 한 잔")
        let naGune = Store(storeName:"naGuNe", name: "나그네파전", info: "동동주와 파전이 맛있는, 비가 오면 떠오르는 곳")
        let ggoZiPub = Store(storeName: "ggoZiPub", name: "꼬지펍", info: "직화구이 꼬치가 맛있는 왕십리 술집")
        
        
        
        //storeList03 : 사근동
        let hoChicken = Store(storeName: "hoChicken", name: "호치킨", info: "저렴하게 맛보는 바삭한 크리스피 치킨")
        let boGoSipDa = Store(storeName: "boGoSipDa", name: "지금, 보고싶다", info: "밤은 짙고 술은 차고 지금, 보고싶다..국내 최초 갤러리전 감성주점")
        let againChicken = Store(storeName: "againChicken", name: "다시올치킨", info: "닭 요리 전문점")
        let giRi = Store(storeName: "giRi", name: "길이식당", info: "성동구를 대표하는 마라탕 맛집")
        let pomFrites = Store(storeName: "pomFrites", name: "폼프리츠", info: "고소고소한 감자튀김과 시원한 맥주")
        let siKi = Store(storeName: "siKi", name: "시키", info: "부담 없이 사케와 일본식 안주를 즐길 수 있는 곳")
        let spicyDakBal = Store(storeName: "spicyDakbal", name: "한양대신닭발", info: "한양대 대표 닭발집")
        
        
        
        //storeList04 : 도선동
        let ddangKo = Store(storeName: "ddangKo", name: "땅코참숯구이", info: "성동구 no.1 고기집")
        let gulAndZimLove = Store(storeName: "gulAndZimLove", name: "굴과 찜사랑", info: "해물 덕후들은 모여라! 생방송투데이에도 나온 해물찜 전문점")
        let lifeBeer = Store(storeName: "lifeBeer", name: "생활맥주", info: "집가는 길에 가볍게 맥주 한 잔 어때요?")
        let matNa = Store(storeName: "matNa", name: "맛나곱창", info: "왕십리 곱창골목 중에서도 유명한 곱창집")
        let yeopGi = Store(storeName: "yeopGi", name: "엽기꼼닭발", info: "수요미식회에도 나온 닭발과 꼼장어 맛집")
        
        
        
        
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

