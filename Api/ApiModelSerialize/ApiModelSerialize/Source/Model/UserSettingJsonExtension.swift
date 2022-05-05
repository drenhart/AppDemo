//
//  UserSettingJsonExtension.swift
//  ApiModelSerialize
//
//  Created by mc Lee on 2022/4/22.
//

import Foundation
import SwiftyJSON
import Common

extension UserSettingsJson: ISwiftyJson {
    public func dFromJSON(json: JSON) {
        Language = json["Language"].string
        ICAOn = json["ICAOn"].bool
        MyQuestions = json["MyQuestions"].fToArray()
        LeaveMessage = json["LeaveMessage"].string
        WinkMessage = json["WinkMessage"].string
        ReceiveWink = json["ReceiveWink"].bool
        ActiveStatusForVipOnly = json["ActiveStatusForVipOnly"].bool
        ExtendDistance = json["ExtendDistance"].bool
        Notification = json["Notification"].bool
        AllowRandomCallIn = json["AllowRandomCallIn"].bool
        RandomChatUserFacet = json["RandomChatUserFacet"].int
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        if let d = Language {
            json["Language"].string = d
        }
        if let d = ICAOn {
            json["ICAOn"].bool = d
        }
        if let d = MyQuestions {
            json["MyQuestions"] = d.dToJSON()
        }
        if let d = LeaveMessage {
            json["LeaveMessage"].string = d
        }
        if let d = WinkMessage {
            json["WinkMessage"].string = d
        }
        if let d = ReceiveWink {
            json["ReceiveWink"].bool = d
        }
        if let d = ActiveStatusForVipOnly {
            json["ActiveStatusForVipOnly"].bool = d
        }
        if let d = ExtendDistance {
            json["ExtendDistance"].bool = d
        }
        if let d = Notification {
            json["Notification"].bool = d
        }
        if let d = AllowRandomCallIn {
            json["AllowRandomCallIn"].bool = d
        }
        if let d = RandomChatUserFacet {
            json["RandomChatUserFacet"].int = d
        }
        return json
    }
}

extension QuestionAndAnswer: ISwiftyJson {
    public func dFromJSON(json : JSON) {
        QuestionId = json["1"].intValue
        AnswerChoiceId = json["2"].intValue
    }
    
    public func dToJSON() -> JSON {
        var j: JSON = ["1" : QuestionId]
        j["2"].int = AnswerChoiceId
        return j
    }
    
    public func toParameters() -> [String : Any] {
        var parameters = [String: Any]()
        parameters["QuestionId"] = QuestionId
        parameters["AnswerChoiceId"] = AnswerChoiceId
        return parameters
    }
}

