//
//  NetworkUtil.swift
//  Common
//
//  Created by mc Lee on 2022/4/23.
//

import Foundation
import UIKit

open class NetworkUtil {

    public static func fGetDeviceLanguageCode() -> String {
        return "en"
    }
    
    public static func fGetDeviceRegionCode() -> String {
        return NSLocale.autoupdatingCurrent.regionCode ?? "US"
    }
    
    public static func fGetDeviceLanguageRegionCode() -> String {
        return "\(fGetDeviceLanguageCode())-\(fGetDeviceRegionCode())"
    }
    
    public static func fInitDefaultURLSession() -> URLSessionConfiguration {
        let cfg = URLSessionConfiguration.default
        cfg.httpCookieStorage = HTTPCookieStorage.shared
        cfg.httpAdditionalHeaders = ["User-Agent" : fGetUserAgent()]
        return cfg
    }
    
    public static func fGetUserAgent() -> String {
        let v = ProcessInfo.processInfo.operatingSystemVersion
        let systemVersion = "\(v.majorVersion).\(v.minorVersion).\(v.patchVersion)"
        let deviceName = UIDevice.current.userInterfaceIdiom.rawValue
        let languageCode = fGetDeviceLanguageRegionCode()
        let appVersion = fGetAppVersion()
        let agent = "IOS/\(deviceName)_\(systemVersion)_r\(Config.c_RTCCallVersion)/\(Config.c_SvnVersion)/\(Config.c_Channel)/\(appVersion)/\(languageCode)"
        return agent
    }
    
    public static func fGetAppVersion() -> String {
        let nsObject: AnyObject? = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as AnyObject?
        let version = nsObject as? String ?? Config.c_Version
        return version
    }

}
