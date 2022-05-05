//
//  DeviceParam.swift
//  Common
//
//  Created by mc Lee on 2022/4/23.
//

import Foundation
import AdSupport
import UIKit

open class DeviceParam: ServerModel {

    open var latitude: Double?
    open var longtitude: Double?
    open var lan: String?
    open var deviceId: String?
    open var adfId: String?
    
    public required init() {
        deviceId = UIDevice.current.identifierForVendor?.uuidString
        adfId = ASIdentifierManager.shared().advertisingIdentifier.description
        lan = NetworkUtil.fGetDeviceLanguageRegionCode()
        latitude = 0
        longtitude = 0
    }
    
}
