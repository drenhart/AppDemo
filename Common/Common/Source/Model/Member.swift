//
//  Member.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import UIKit

open class Member: ServerModel {

    open var Id: Int = 0
    open var NickName: String = ""
    open var Gender: Gender = .female
    open var VipLevel: VipLevels = VipLevels.ceVipLevelNone
    open var Avatar: String?
    open var AvatarIcon: String?
    open var Recording: String?
    open var Country: String?
    open var Province: String?
    open var City: String?
    open var Distance: String?
    open var LastActiveS: String?
    open var OnlineStatus = MemberOnlineStatus.NotOnline
    open var Age: Int = 0
    open var PhotosCount: Int?
    open var VerifyVideo: BodyShow?
    open var Profile: UserProfileJson?
    open var ContactInfos: [UserContactInfo]?
    open var ContactWays: [String: UserContactInfo]?
    open var PublicBodyShows: [BodyShow]?
    open var PrivateBodyShows: [BodyShow]?
    open var IsPartial: Bool?
    open var HotTags: [HotTag]?
    open var ViewCount: Int?
    
}

