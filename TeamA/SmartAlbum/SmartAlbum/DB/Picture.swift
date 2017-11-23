//
//  Picture.swift
//  SmartAlbum
//
//  Created by SeonIl Kim on 2017. 11. 23..
//  Copyright © 2017년 SeonIl Kim. All rights reserved.
//

import Foundation
import RealmSwift
import Photos

class Picture:Object {
    
    @objc dynamic var id:String = "" // 사진 식별자
    @objc dynamic var keyword:String = "" // 키워드
//    @objc dynamic var locX:Double = 0.0 // x좌표
//    @objc dynamic var locY:Double = 0.0 // y좌표
    @objc dynamic var location:Location?
    @objc dynamic var createDate:Date? = nil
    @objc dynamic var modifyDate:Date? = nil
    @objc dynamic var flag:Int = 0 // 키워드 flag. 값 입력이 됬으면 1, 아직 머신러닝안했으면 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(asset: PHAsset){
        self.init()
        self.id = asset.localIdentifier
        self.createDate = asset.creationDate
        self.modifyDate = asset.modificationDate
        if let lati = asset.location?.coordinate.latitude, let longti = asset.location?.coordinate.longitude {
            self.location = Location()
            self.location?.latitude = lati
            self.location?.longtitude = longti
        }
    }
}

class Location:Object {
    @objc dynamic var latitude:Double = 0.0
    @objc dynamic var longtitude:Double = 0.0
    @objc dynamic var city:String = "" // 도시
}
