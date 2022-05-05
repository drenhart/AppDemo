//
//  MyProfile.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

public class MyProfile: ServerModel {
    open var Member: Member?
    open var LoginInfo: LoginInfo?
    open var MyInfo: MyInfo?
    open var VipInfo: MyVipInfo?
    open var MyAppConfig: MyAppConfig?
    open var MySetting: UserSettingsJson?
}

public class LoginInfo: ServerModel {
    public var LoginName: String = ""
    public var Password: String = ""
    
    public init(loginName: String, password: String) {
        self.LoginName = loginName
        self.Password = password
    }
    
    public required init() {
        
    }
}

public class MyInfo: ServerModel {
    open var Birthday: Date?
    open var SearchFilter: UserSearchFilterJson?
}

public class MyVipInfo: ServerModel {
    open var VipLevel: VipLevels = VipLevels.ceVipLevelNone
    open var MessageVipTime: Date?
    open var DiamondVipTime: Date?
    open var TopVipTime: Date?
    open var IsGiftVip: Bool = false
    
    
    private var pVipTime: Date? {
        switch VipLevel {
        case .ceVipLevelSuper:
            return TopVipTime
        case .ceVipLevelDiamond:
            return DiamondVipTime
        default:
            return MessageVipTime
        }
    }
    
//    public var pMyVipExpire: String? {
//        if let vipDate = pVipTime {
//            return Localizable.vip_expireAt(IsGiftVip, vipDate.pDateString)
//        }
//        return nil
//    }
}


open class UserSearchFilterJson: ServerModel {
    open var SearchModeData: SearchMode = SearchMode.distance
    open var Country: String?
    open var ProvinceIndex: Int?
    open var LookForGenders: [Gender]?
    open var AgeMin: Int?
    open var AgeMax: Int?
    open var DistanceMin: Int?
    open var DistanceMax: Int?
    open var Online: Bool?
    open var DisIndex: Int?
    open var Purpose: [String]?
    open var AboutSex: [String]?
    open var ExpectRelation: [String]?
    open var ExpectSexExp: [String]?
    open var OneNightExp: [String]?
    open var HeightMin: Int?
    open var HeightMax: Int?
    open var HeightFtMin: String?
    open var HeightFtMax: String?
    
    public init (searchMode: SearchMode) {
        self.SearchModeData = searchMode
    }
    
    public required init() {
        
    }
}

public class MyAppConfig: ServerModel {
    open var SearchConfig: SearchFilterConfig?
    open var ShowBatchHiAlert: Bool?
    open var ReviewAlert: ReviewAlertInfo?
}

open class SearchFilterConfig: ServerModel {
    open var AgeMin: Int?
    open var AgeMax: Int?
    open var DistanceMax: Int?
    open var DistanceAllowInfinity: Bool?
    open var AllowDistanceSteps: [Int]?
}

public class ReviewAlertInfo: ServerModel {
    open var Alert: Bool = false
    open var AlertOption: String = ""
    open var AlertTitle: String = ""
    open var AlertContent: String = ""
    open var AlertGoButtonText: String = ""
    open var AlertCancelButtonText: String = ""
    open var FreeMessageCount: Int = 0
    
    // extesion by client
    open var ShowInAppReview: Bool = true
    open var InAppReviewStartTime = 30
    open var InAppReviewEndTime = 90
    open var MaxInAppReviewDisplayCount = 1
    open var MinInAppReviewInterval = 10
    open var MaxInAppReviewInterval = 30
    open var ChatVipInterceptor = 2
}

public class UserSettingsJson: ServerModel {
    open var Language: String?
    open var ICAOn: Bool?
    open var MyQuestions: [QuestionAndAnswer]?
    open var LeaveMessage: String?
    open var WinkMessage: String?
    open var ReceiveWink: Bool?
    open var ActiveStatusForVipOnly: Bool?
    open var ExtendDistance: Bool?
    open var Notification: Bool?
    open var AllowRandomCallIn: Bool?
    open var RandomChatUserFacet: Int?
}
