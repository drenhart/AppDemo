//
//  UserContactInfo.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

open class UserContactInfo: ServerModel {
    
    open var ContactPlatform: String = ""
    open var ContactContent: String?
    open var ConatctPlatfromIcon: String?
    
    public init(platform: String, content: String? = nil) {
        self.ContactPlatform = platform
        self.ContactContent = content
    }
    
    public required init() {
        
    }
}
