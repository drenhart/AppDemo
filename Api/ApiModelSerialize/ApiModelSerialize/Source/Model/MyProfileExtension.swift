//
//  MyProfileExtension.swift
//  ApiModelSerialize
//
//  Created by mc Lee on 2022/4/22.
//

import Foundation
import SwiftyJSON
import Common

extension MyProfile: ISwiftyJson {
    
    public func dFromJSON(json: JSON) {
        Member = json["Member"].fToObject()
        LoginInfo = json["LoginInfo"].fToObject()
        MyInfo = json["MyInfo"].fToObject()
        VipInfo = json["VipInfo"].fToObject()
        MyAppConfig = json["MyAppConfig"].fToObject()
        MySetting = json["MySetting"].fToObject()
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        if let d = Member {
            json["Member"] = d.dToJSON()
        }
        if let d = LoginInfo {
            json["LoginInfo"] = d.dToJSON()
        }
        if let d = MyInfo {
            json["MyInfo"] = d.dToJSON()
        }
        if let d = VipInfo {
            json["VipInfo"] = d.dToJSON()
        }
        if let d = MyAppConfig {
            json["MyAppConfig"] = d.dToJSON()
        }
        if let d = MySetting {
            json["MySetting"] = d.dToJSON()
        }
        return json
    }
    
}

extension LoginInfo: ISwiftyJson {
    
    public func dFromJSON(json: JSON) {
        LoginName = json["LoginName"].stringValue
        Password = json["Password"].stringValue
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        json["LoginName"].string = LoginName
        json["Password"].string = Password
        return json
    }
}

extension MyInfo: ISwiftyJson {
    
    public func dFromJSON(json: JSON) {
        Birthday = json["Birthday"].fToDate()
        SearchFilter = json["SearchFilter"].fToObject()
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        if let d = Birthday {
            json["Birthday"].string = FormatUtil.pISODateFormatter.string(from: d)
        }
        if let d = SearchFilter {
            json["SearchFilter"] = d.dToJSON()
        }
        return json
    }
}

extension MyAppConfig: ISwiftyJson {
    
  public func dFromJSON(json: JSON) {
        SearchConfig = json["SearchConfig"].fToObject()
        ShowBatchHiAlert = json["ShowBatchHiAlert"].bool
        ReviewAlert = json["ReviewAlert"].fToObject()
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        if let d = SearchConfig {
            json["SearchConfig"] = d.dToJSON()
        }
        if let d = ShowBatchHiAlert {
            json["ShowBatchHiAlert"].bool = d
        }
        if let d = ReviewAlert {
            json["ReviewAlert"] = d.dToJSON()
        }
        return json
    }
}

extension UserSearchFilterJson: ISwiftyJson {
   
    public func dFromJSON(json: JSON) {
        SearchModeData = Common.SearchMode(rawValue: json["SearchMode"].intValue) ?? .distance
        Country = json["Country"].string
        ProvinceIndex = json["ProvinceIndex"].int
        LookForGenders = json["LookForGenders"].fToArray()
        AgeMin = json["AgeMin"].int
        AgeMax = json["AgeMax"].int
        DistanceMin = json["DistanceMin"].int
        DistanceMax = json["DistanceMax"].int
        Online = json["Online"].bool
        Purpose = json["Purpose"].fToArray()
        AboutSex = json["AboutSex"].fToArray()
        ExpectRelation = json["ExpectRelation"].fToArray()
        ExpectSexExp = json["ExpectSexExp"].fToArray()
        OneNightExp = json["OneNightExp"].fToArray()
        HeightMin = json["HeightMin"].int
        HeightMax = json["HeightMax"].int
        HeightFtMin = json["HeightFtMin"].string
        HeightFtMax = json["HeightFtMin"].string
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        json["SearchMode"].int = SearchModeData.rawValue
        if let d = Country {
            json["Country"].string = d
        }
        if let d = ProvinceIndex {
            json["ProvinceIndex"].int = d
        }
        // warnning: 手动修改过
        if let d = LookForGenders {
            var gs = [Int]()
            for g in d {
                gs.append(g.rawValue)
            }
            json["LookForGenders"].arrayObject = gs
        }
        if let d = AgeMin {
            json["AgeMin"].int = d
        }
        if let d = AgeMax {
            json["AgeMax"].int = d
        }
        if let d = DistanceMin {
            json["DistanceMin"].int = d
        }
        if let d = DistanceMax {
            json["DistanceMax"].int = d
        }
        if let d = Online {
            json["Online"].bool = d
        }
        if let d = Purpose {
            json["Purpose"].arrayObject = d
        }
        if let d = AboutSex {
            json["AboutSex"].arrayObject = d
        }
        if let d = ExpectRelation {
            json["ExpectRelation"].arrayObject = d
        }
        if let d = ExpectSexExp {
            json["ExpectSexExp"].arrayObject = d
        }
        if let d = OneNightExp {
            json["OneNightExp"].arrayObject = d
        }
        if let d = HeightMin {
            json["HeightMin"].int = d
        }
        if let d = HeightMax {
            json["HeightMax"].int = d
        }
        if let d = HeightFtMin {
            json["HeightMin"].string = d
        }
        if let d = HeightFtMax {
            json["HeightMax"].string = d
        }
        return json
    }
}

extension SearchFilterConfig: ISwiftyJson {
    public func dFromJSON(json: JSON) {
        AgeMin = json["AgeMin"].int
        AgeMax = json["AgeMax"].int
        DistanceMax = json["DistanceMax"].int
        DistanceAllowInfinity = json["DistanceAllowInfinity"].bool
        AllowDistanceSteps = json["AllowDistanceSteps"].fToArray()
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        if let d = AgeMin {
            json["AgeMin"].int = d
        }
        if let d = AgeMax {
            json["AgeMax"].int = d
        }
        if let d = DistanceMax {
            json["DistanceMax"].int = d
        }
        if let d = DistanceAllowInfinity {
            json["DistanceAllowInfinity"].bool = d
        }
        if let d = AllowDistanceSteps {
            json["AllowDistanceSteps"].arrayObject = d
        }
        return json
    }
}

extension ReviewAlertInfo: ISwiftyJson {
    
    public func dFromJSON(json: JSON) {
        Alert = json["Alert"].boolValue
        AlertOption = json["AlertOption"].stringValue
        AlertTitle = json["AlertTitle"].stringValue
        AlertContent = json["AlertContent"].stringValue
        AlertGoButtonText = json["AlertGoButtonText"].stringValue
        AlertCancelButtonText = json["AlertCancelButtonText"].stringValue
        FreeMessageCount = json["FreeMessageCount"].intValue
        
        if #available(iOS 10.3, *) {
            ShowInAppReview = json["ShowInAppReview"].bool ?? true
        } else {
            ShowInAppReview = false
        }
        
        InAppReviewStartTime  = json["InAppReviewStartTime"].int ?? 30
        InAppReviewEndTime  = json["InAppReviewEndTime"].int ?? 90
        MaxInAppReviewDisplayCount  = json["MaxInAppReviewDisplayCount"].int ?? 1
        MinInAppReviewInterval  = json["MinInAppReviewInterval"].int ?? 10
        MaxInAppReviewInterval  = json["MaxInAppReviewInterval"].int ?? 30
        ChatVipInterceptor  = json["ChatVipInterceptor"].int ?? 2
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        json["Alert"].bool = Alert
        json["AlertOption"].string = AlertOption
        json["AlertTitle"].string = AlertTitle
        json["AlertContent"].string = AlertContent
        json["AlertGoButtonText"].string = AlertGoButtonText
        json["AlertCancelButtonText"].string = AlertCancelButtonText
        json["FreeMessageCount"].int = FreeMessageCount
        
        json["InAppReviewStartTime"].intValue  = self.InAppReviewStartTime
        json["InAppReviewEndTime"].intValue  = self.InAppReviewEndTime
        json["MaxInAppReviewDisplayCount"].intValue  = self.MaxInAppReviewDisplayCount
        json["MinInAppReviewInterval"].intValue  = self.MinInAppReviewInterval
        json["MaxInAppReviewInterval"].intValue  = self.MaxInAppReviewInterval
        json["ChatVipInterceptor"].intValue  = self.ChatVipInterceptor
        return json
    }
}
