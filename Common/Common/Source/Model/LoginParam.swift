//
//  LoginParam.swift
//  Common
//
//  Created by mc Lee on 2022/4/23.
//

import Foundation

open class LoginParam: ServerModel {

    open var LoginName: String?
    open var Password: String?
    open var Device: DeviceParam?
    open var NeedsProfile: [String]?
    open var PhotoCountMode = Common.PhotoCountMode.avatarVerifyPublic
    
    public init(loginName: String, password: String) {
        self.LoginName = loginName
        self.Password = password
        self.NeedsProfile = ["Hobbies", "Ethnicity", "Mariage", "Faith", "Smoking", "Drinking"]
    }
    
    public required init() {
        
    }
    
}
