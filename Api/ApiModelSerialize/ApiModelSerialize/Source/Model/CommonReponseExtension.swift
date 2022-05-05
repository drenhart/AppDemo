//
//  CommonReponseExtension.swift
//  ApiModelSerialize
//
//  Created by mc Lee on 2022/5/5.
//

import Foundation
import Common
import SwiftyJSON

extension CommonResponse : ISwiftyJson {

    func dFromJSON(json: JSON) {
        StatusCode = EResponseStatusCode(rawValue: json["StatusCode"].int ?? EResponseStatusCode.eUnknownRequest.rawValue) ?? .eUnknownRequest
        Msg = json["Msg"].string
        var t = T()
        if var j = t as? ISwiftyJson {
            j.dFromJSON(json: json["Data"])
            t = j as! T
        } else {
            fatalError("\(type(of: T.self)) cannot parse not impl SwiftJson, and can not load from response json")
        }
        Data = t
    }
    
    func dToJSON() -> JSON {
        var json = JSON()
        json["StatusCode"].int = StatusCode.rawValue
        if let d = Msg {
            json["Msg"].string = d
        }
        if let d = Data {
            json["Data"] = (d as! ISwiftyJson).dToJSON()
        }
        return json
    }

}
