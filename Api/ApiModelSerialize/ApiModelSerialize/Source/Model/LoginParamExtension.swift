//
//  LoginParam.swift
//  ApiModelSerialize
//
//  Created by mc Lee on 2022/5/5.
//

import Foundation
import SwiftyJSON
import Common

extension LoginParam: ISwiftyJson {

    public func dFromJSON(json: JSON) {
        
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        json["LoginName"].string = LoginName
        json["Password"].string = Password
        if let d = Device {
            json["Device"] = d.dToJSON()
        }
        json["NeedsProfile"].arrayObject = NeedsProfile
        json["PhotoCountMode"].int = PhotoCountMode.rawValue
        return json
    }

}

extension DeviceParam: ISwiftyJson {
    public func dFromJSON(json: JSON) {
        latitude = json["latitude"].double
        longtitude = json["longtitude"].double
        lan = json["lan"].string
        deviceId = json["deviceId"].string
        adfId = json["adfId"].string
    }
    
    public func dToJSON() -> JSON {
        var json = JSON()
        if let d = latitude {
            json["latitude"].double = d
        }
        if let d = longtitude {
            json["longtitude"].double = d
        }
        if let d = lan {
            json["lan"].string = d
        }
        if let d = deviceId {
            json["deviceId"].string = d
        }
        if let d = adfId {
            json["adfId"].string = d
        }
        return json
    }
}
