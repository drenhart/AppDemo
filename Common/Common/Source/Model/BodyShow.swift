//
//  BodyShow.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

open class BodyShow: ServerModel {

    open var Id: Int = 0
    open var MemberId: Int = 0
    open var ViewCount: Int?
    open var Photo: String?
    open var Video: String?
    open var PhotoUrlIcon: String?
    open var Recording: String?
    open var Content: String?
    open var PublishTimeS: String?
    open var LoveCount: Int?
    open var VideoPreviewPhotos: [String]?
    open var SubPhotos: [String]?
    open var BodyshowType: BodyshowType = .Public
    open var CommentCount: Int?
    open var HotTags: [HotTag]?
    
}

open class BodyShowList: ServerModel {
    
    open var List: [BodyShow]?
    
    public required init() {
        
    }
    
    init(list: [BodyShow]) {
        self.List = list
    }
    
}
