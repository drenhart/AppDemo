//
//  MyVipInfo.swift
//  ApiModelSerialize
//
//  Created by mc Lee on 2022/4/22.
//

import Foundation
import Common
import SwiftyJSON

extension MyVipInfo: ISwiftyJson {
    public func dFromJSON(json: JSON) {
        VipLevel = VipLevels(rawValue: json["VipLevel"].intValue)!
        MessageVipTime = json["MessageVipTime"].fToDate()
        DiamondVipTime = json["DiamondVipTime"].fToDate()
        TopVipTime = json["TopVipTime"].fToDate()
        if let d = json["IsGiftVip"].bool {
            IsGiftVip = d
        }
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        json["VipLevel"].int = VipLevel.rawValue
        if let d = MessageVipTime {
            json["MessageVipTime"].string = FormatUtil.pISODateFormatter.string(for: d)
        }
        if let d = DiamondVipTime {
            json["DiamondVipTime"].string = FormatUtil.pISODateFormatter.string(for: d)
        }
        if let d = TopVipTime {
            json["TopVipTime"].string = FormatUtil.pISODateFormatter.string(for: d)
        }
        json["IsGiftVip"].bool = IsGiftVip
        return json
    }
}
