//
//  ServerModel.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

public protocol IServerModel {
    init()
    
    mutating func aLoadFromJSONString(str: String)
    func aToJSONString() -> String
}

open class ServerModel: IServerModel {
    public required init() {
        
    }
    
    open func aLoadFromJSONString(str: String) {
        Api.pModelSerialize.aLoadFromJSONString(model: self, str: str)
    }
    
    open func aToJSONString() -> String {
        return Api.pModelSerialize.aToJSONString(model: self)
    }
}

extension Array: IServerModel where Element: IServerModel {
    public func aLoadFromJSONString(str: String) {
        Api.pModelSerialize.aLoadFromJSONString(model: self, str: str)
    }
    
    public func aToJSONString() -> String {
        return Api.pModelSerialize.aToJSONString(model: self)
    }
}

extension Dictionary: IServerModel where Value: IServerModel {
    public func aLoadFromJSONString(str: String) {
        Api.pModelSerialize.aLoadFromJSONString(model: self, str: str)
    }
    
    public func aToJSONString() -> String {
        return Api.pModelSerialize.aToJSONString(model: self)
    }
}

public class ServerCounter: ServerModel {
    public var Count: Int = 0
}
