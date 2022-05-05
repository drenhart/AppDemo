//
//  Config.swift
//  Common
//
//  Created by mc Lee on 2022/4/23.
//

import UIKit

public class Config {

    private static let c_ServerHost = "soumi.f3322.net:1507"
    public static let c_RTCCallVersion = 300
    public static let c_SvnVersion = "7100"
    public static var c_Channel = "1001"
    public static var c_Version = "2.0"
    
    public static func fGetServerHost() -> String {
        return c_ServerHost
    }

}
