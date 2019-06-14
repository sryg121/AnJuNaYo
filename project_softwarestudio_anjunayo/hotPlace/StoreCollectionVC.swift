//
//  StoreCollectionVC.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 21/05/2019.
//  Edited by 윤세령 on 23/05/2019.
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
        let alert = UIAlertController(title: "\(item.storeName) - \(item.storeDetail)", message: nil, preferredStyle: .actionSheet)
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
        //dvc.storeAdd = store.storeAdd
        //dvc.storeDetail = store.storeDetail
        
        navigationController?.pushViewController(dvc, animated: true)
    }
}

extension StoreCollectionVC: UICollectionViewDelegateFlowLayout {
    
    // Collection View Cell 의 windth, height 를 지정할 수 있습니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (view.frame.width - 12) / 3
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
        
        let store1 = Store(storeName: "그림1", name: "조명창고", address: "1", detail: "카시스소다가 정말 맛있어요!")
        let store2 = Store(storeName: "store2", name: "한신포차", address: "2", detail: "닭발에 소주가 최고에요")
        let store3 = Store(storeName: "store3", name: "낙원스낵", address: "3", detail: "날씨 좋을 때는 피맥이죠")
        let store4 = Store(storeName: "store4", name: "백번", address: "4", detail: "한양대 술집하면 백번")
        let store5 = Store(storeName: "store5", name: "한양대신닭발", address: "5", detail: "닭발에 소주가 짱이에요")
        let store6 = Store(storeName: "store6", name: "일번지", address: "6", detail: "일번지는 칵테일 소주")
        let store7 = Store(storeName: "store7", name: "종로빈대떡", address: "7", detail: "빈대떡에 막걸리 한잔")
        let store8 = Store(storeName: "store8", name: "곱창하우스", address: "8", detail: "곱쏘 곱쏘")
        let store9 = Store(storeName: "store9", name: "김부삼", address: "9", detail: "삼겹살에는 소맥 한잔")
        let store10 = Store(storeName: "store10", name: "노란통닭", address: "10", detail: "언제나 최고인 치맥")
        
        storeList = [store1, store2, store3, store4, store5, store6, store7, store8, store9, store10]
        
        /*
        //storeList01
        let yukSha = Store(name: "육앤샤", address: "성동구 마조로5길 5", detail: "육회와 샤브샤브의 조화", recFood: ["육회", "샤브샤브"])
        let eightFt = Store(name: "8피트", address: "성동구 마조로1길 39", detail: "시원한 루프탑 바에서 맥주 한 잔", recFood: ["피자"])
        let gaengSaeng = Store(name: "갱생", address: "성동구 마조로7길 5", detail: "착하게 삽시다", recFood: ["명란크림파스탕", "오코노미야키"])
        let hanSin = Store(name: "한신포차", address: "성동구 마조로5길 12-1", detail: "메뉴 성공률 100%", recFood: ["국물닭발", "계란말이"])
        let hChong = Store(name: "회뜨는 총각", address: "성동구 마조로5길 4-12", detail: "한양대가 본점이라는 사실, 알고 계셨나요?", recFood: ["방어회", "오징어회"])
        let meJong = Store(name: "메종드 혁이네", address: "성동구 마조로3나길 27", detail: "만석일 땐 불이 들어와요", recFood: ["바지락술찜", "삼치구이"])
        let nakWon = Store(name: "낙원스낵", address: "성동구 마조로5길 14", detail: "간단하게 피맥", recFood: ["베이컨치즈피자", "마약옥수수"])
        
        //storeList02
        let firstAvenue = Store(name: "일번지", address: "성동구 마조로 19-10", detail: "닭떡찜과 이모님의 콜라 서비스가 인상적인 곳", recFood: ["닭떡찜", "물냉면"])
        let boGoSipDa = Store(name: "지금, 보고싶다", address: "성동구 마조로 25 제일빌딩", detail: "밤은 짙고 술은 차고 지금, 보고싶다..국내 최초 갤러리전 감성주점", recFood: ["감바스", "밀푀유나베"])
        let cloudRain = Store(name: "운우", address: "성동구 행당동 158-53", detail: "혼술하기 좋은 곳", recFood: ["통삼겹조림", "보리소주"])
        let dongChon = Store(name: "동촌", address: "성동구 행당1동 158-58", detail: "밤막걸리가 맛있는 곳", recFood: ["김치전", "알밤막걸리"])
        let gobStory = Store(name: "곱창이야기", address: "성동구 마조로5길 3", detail: "소곱창과 가래떡의 조합", recFood: ["한우곱창모듬"])
        let goldenDragon = Store(name: "금룡", address: "성동구 마조로 17 한양시장", detail: "24시간 중국집, 배달도 됩니다", recFood: ["세트메뉴", "삼선짬뽕"])
        let hoDoRi = Store(name: "호돌이전파사", address: "성동구 마조로3길 10", detail: "인생은 황태를 먹기 전과 후로 나뉜다", recFood: ["황태", "촉촉오징어"])
        let jinGook = Store(name: "진국", address: "성동구 마조로 7", detail: "24시간 해장국 맛집", recFood: ["국밥", "물냉면"])
        let kyeongSeong = Store(name: "경성주막1929", address: "성동구 마조로 11", detail: "가성비 좋은 퓨전이자카야", recFood: ["오코노미야키", "나베"])
        let lightHouse = Store(name: "조명창고", address: "성동구 마조로 22-3", detail: "소개팅과 데이트, 모임에 적합한 분위기 좋은 술집", recFood: ["매콤크림파스타", "갈릭새우크림파스타"])
        let manLi = Store(name: "만리향 양꼬치", address: "성동구 마조로5길 3-3", detail: "한양대 대표 양꼬치 집", recFood: ["꿔바로우", "양꼬치"])
        let moonBar = Store(name: "달바", address: "성동구 마조로3가길 21", detail: "분위기 좋은 곳에서 칵테일 한 잔", recFood: ["칵테일"])
        let naGune = Store(name: "나그네파전", address: "성동구 마조로1길 4", detail: "동동주와 파전이 맛있는, 비가 오면 떠오르는 곳", recFood: ["파전", "찹쌀동동주"])
        
        //storeList03
        let againChicken = Store(name: "다시올치킨", address: "성동구 사근동8길 8", detail: "닭요리 전문점", recFood: ["닭칼국수", "순살후라이드"])
        let dieGgozi = Store(name: "다이꼬지", address: "성동구 마조로3나길 26", detail: "사근동 맛있는 이자카야", recFood: ["생연어회", "통오징어그릴"])
        let giRiRestaurant = Store(name: "길이식당", address: "성동구 사근동길 21-1", detail: "성동구를 대표하는 마라탕 맛집", recFood: ["마라탕", "온면"])
        let pomFrites = Store(name: "폼프리츠", address: "성동구 사근동길 6", detail: "고소고소한 감자튀김과 시원한 맥주", recFood: ["L + 소스2개", "스노우비어"])
        let siKi = Store(name: "시키", address: "성동구 사근동길 43", detail: "부담 없이 사케와 일본식 안주를 즐길 수 있는 곳", recFood: ["삼겹숙주볶음", "고등어초회"])
        let thaiInPlate = Store(name: "타이인플레이트", address: "성동구 사근동8길 3", detail: "부담스럽지 않은 태국음식을 맛보고 싶을 때", recFood: ["팟타이", "카오팟"])
        
        //storeList04
        let ddangKo = Store(name: "땅코참숯구이", address: "성동구 행당로17길 26", detail: "성동구 고기집 no.1", recFood: ["삼겹살", "목살", "물냉면"])
        let gulAndZimLove = Store(name: "굴과 찜사랑", address: "성동구 행당로17길 23", detail: "해물 덕후들은 모여라! 생방송투데이에도 나온 해물찜 전문점", recFood: ["해물찜", "굴국밥", "굴칼국수"])
        let lifeBeer = Store(name: "생활맥주", address: "성동구 행당로17길 22-1", detail: "집가는 길 가볍게 맥주 한 잔 어때요?", recFood: ["크리스피 텐더와 감자", "생맥주"])
        let noGaRi = Store(name: "노가리슈퍼", address: "성동구 행당로17길 21", detail: "왕십리 가성비 술집", recFood: ["짝태", "닭치기한상후라이드"])
        let suShiDoKu = Store(name: "스시도쿠", address: "성동구 왕십리광장로 8", detail: "맛을 얻고 정을 얻고 사람을 얻는 곳, 오직 입소문만으로 왕십리 최고의 맛집에 등극한 핫플레이스", recFood: ["특선스시"])
        let yeopGi = Store(name: "엽기꼼닭발", address: "성동구 왕십리로22길 3", detail: "수요미식회에도 나온 닭발과 꼼장어 맛집", recFood: ["엽기꼼장어", "뼈없는 닭발"])
        
        var storeList01 = [yukSha, eightFt, gaengSaeng, hanSin, hChong, meJong, nakWon]
        var storeList02 = [firstAvenue, boGoSipDa, cloudRain, dongChon, gobStory, goldenDragon, hoDoRi, jinGook, kyeongSeong, lightHouse, manLi, moonBar, naGune]
        var storeList03 = [againChicken, dieGgozi, giRiRestaurant, pomFrites, siKi, thaiInPlate]
        var storeList04 = [ddangKo, gulAndZimLove, lifeBeer, noGaRi, suShiDoKu, yeopGi]
 */
    }
}
