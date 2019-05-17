//
//  DataCenter.swift
//  Anjunayo
//
//  Created by ddd on 07/05/2019.
//  Copyright © 2019 ddd. All rights reserved.
//

import Foundation

struct StoreInfo {
    var name: String
    var loc: String
    var menu: String
    var etc: String
    
    init(name: String, loc: String, menu: String, etc: String) {
        self.name = name
        self.loc = loc
        self.menu = menu
        self.etc = etc
    }
}

var StoreInfo1: StoreInfo = StoreInfo(name: "캐빈오크", loc: "서울특별시 성동구 행당동 19-46", menu: "empty", etc: "empty")
var StoreInfo2: StoreInfo = StoreInfo(name: "달포차", loc: "서울특별시 성동구 행당동 4-36", menu: "empty", etc: "empty")
var StoreInfo3: StoreInfo = StoreInfo(name: "미시간", loc: "서울특별시 성동구 행당동 4-20", menu: "empty", etc: "empty")
var StoreInfo4: StoreInfo = StoreInfo(name: "낙원스낵", loc: "서울특별시 성동구 행당동 마조로5길 14", menu: "empty", etc: "empty")
var StoreInfo5: StoreInfo = StoreInfo(name: "아씨펍", loc: "서울특별시 성동구 행당동 마조로3가길 30", menu: "empty", etc: "empty")
var StoreInfo6: StoreInfo = StoreInfo(name: "한신포차 한양대점", loc: "서울특별시 성동구 행당동 마조로5길 12-6", menu: "empty", etc: "empty")
var StoreInfo7: StoreInfo = StoreInfo(name: "할리비어", loc: "서울특별시 성동구 행당동 6-2", menu: "empty", etc: "empty")
var StoreInfo8: StoreInfo = StoreInfo(name: "호돌이전파사", loc: "서울특별시 성동구 행당동 159-2", menu: "empty", etc: "empty")
var StoreInfo9: StoreInfo = StoreInfo(name: "Craft Hop's Hanyang", loc: "서울특별시 성동구 행당동 마조로5길 11", menu: "empty", etc: "empty")
var StoreInfo10: StoreInfo = StoreInfo(name: "봉쥬비어", loc: "서울특별시 성동구 행당동 19-50", menu: "empty", etc: "empty")
var StoreInfo11: StoreInfo = StoreInfo(name: "사바사바호프", loc: "서울특별시 성동구 행당동 4-33", menu: "empty", etc: "empty")

var StoreInfoArr = [StoreInfo1, StoreInfo2, StoreInfo3, StoreInfo4, StoreInfo5, StoreInfo6, StoreInfo7, StoreInfo8, StoreInfo9, StoreInfo10, StoreInfo11]

