//
//  IApiModelSerialize.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

public protocol IApiModelSerialize {
    mutating func aLoadFromJSONString<T>(model: T, str: String)
    func aToJSONString<T>(model: T) -> String
    func aConvertJSONStringToArray<T>(type: T.Type, str: String) -> [T] where T: ServerModel
}
