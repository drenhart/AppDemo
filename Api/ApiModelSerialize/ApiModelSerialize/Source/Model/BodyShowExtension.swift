//
//  BodyShowExtension.swift
//  ApiModelSerialize
//
//  Created by mc Lee on 2022/4/22.
//

import Foundation
import SwiftyJSON
import Common

extension BodyShow: ISwiftyJson {
    
    public func dFromJSON(json: JSON) {
        Id = json["Id"].intValue
        MemberId = json["MemberId"].intValue
        ViewCount = json["ViewCount"].int
        Photo = json["Photo"].string
        Video = json["Video"].string
        PhotoUrlIcon = json["PhotoUrlIcon"].string
        Recording = json["Recording"].string
        Content = json["Content"].string
        PublishTimeS = json["PublishTimeS"].string
        LoveCount = json["LoveCount"].int
        VideoPreviewPhotos = json["VideoPreviewPhotos"].fToArray()
        SubPhotos = json["SubPhotos"].fToArray()
        if let type = Common.BodyshowType(rawValue: json["BodyshowType"].intValue) {
            BodyshowType = type
        }
        CommentCount = json["CommentCount"].int
        HotTags = json["HotTags"].fToArray()
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        json["Id"].int = Id
        json["MemberId"].int = MemberId
        if let d = ViewCount {
            json["ViewCount"].int = d
        }
        if let d = Photo {
            json["Photo"].string = d
        }
        if let d = Video {
            json["Video"].string = d
        }
        if let d = PhotoUrlIcon {
            json["PhotoUrlIcon"].string = d
        }
        if let d = Recording {
            json["Recording"].string = d
        }
        if let d = Content {
            json["Content"].string = d
        }
        if let d = PublishTimeS {
            json["PublishTimeS"].string = d
        }
        if let d = LoveCount {
            json["LoveCount"].int = d
        }
        if let d = VideoPreviewPhotos {
            json["VideoPreviewPhotos"].arrayObject = d
        }
        if let d = SubPhotos {
            json["SubPhotos"].arrayObject = d
        }
        json["BodyshowType"].int = BodyshowType.rawValue
        if let d = CommentCount {
            json["CommentCount"].int = d
        }
        if let d = HotTags {
            json["HotTags"] = d.dToJSON()
        }
        return json
    }
    
}

extension HotTag: ISwiftyJson {
    public func dFromJSON(json: JSON) {
        Tag = json["Tag"].stringValue
        PosMask = json["PosMask"].intValue
        Type = json["Type"].int
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        json["Tag"].string = Tag
        json["PosMask"].int = PosMask
        if let d = Type {
            json["Type"].int = d
        }
        return json
    }
    
}
