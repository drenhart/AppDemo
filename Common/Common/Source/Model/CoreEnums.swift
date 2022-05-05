//
//  CoreEnums.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import UIKit

public enum Gender : Int {
    case female = 0
    case male = 1
}

public extension Gender {
    func oppsite() -> Gender {
        return self == .female ? Gender.male : Gender.female
    }
}

public enum VipLevels : Int {
    case ceVipLevelNone =       0
    case ceVipLevelMessage =    1
    case ceVipLevelDiamond =    2
    case ceVipLevelSuper =      4
    
    case ceVipLevelMessageAndDiamond =          3
    case ceVipLevelMessageAndSuper =            5
    case ceVipLevelDiamondAndSuper =            6
    case ceVipLevelMessageAndDiamondAndSuper =  7
}

public enum MemberOnlineStatus: Int {
    case NotVisible = -1
    case Online = 0
    case NotOnline = 1
}

public enum BodyshowType: Int {
    case VerifyVideo = 0
    case Public = 1
    case Private = 5
}

public enum SearchMode: Int {
    case provice = 0
    case distance = 1
}

public enum PhotoCountMode: Int {
    case none = 0
    case avatar = 1 // 1
    case verfiy = 2 // 2
    case `public` = 4 // 4
    case `private` = 8 // 8
    
    case avatarVerifyPublic = 7
    case all = 15
}
