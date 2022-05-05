//
//  PApiModelSerialize.swift
//  ApiModelSerialize
//
//  Created by mc Lee on 2022/4/22.
//

import Foundation
import Common
import SwiftyJSON

public class PApiModelSerialize: IApiModelSerialize {

    public init() {
        
    }
    
    public func aLoadFromJSONString<T>(model: T, str: String) {
        if var m = model as? ISwiftyJson {
            m.dFromJSON(json: JSON(parseJSON: str))
        }
    }
    
    public func aToJSONString<T>(model: T) -> String {
        if let m = model as? ISwiftyJson {
            return m.dToJSON().rawString()!
        }
        fatalError("Can't deSerialize")
    }
    
    public func aConvertJSONStringToArray<T>(type: T.Type, str: String) -> [T] where T : IServerModel {
        let arrayValue = JSON(parseJSON: str)
        var array = [T]()
        for j in arrayValue {
            if let jsonString = j.1.rawString() {
                var t = T()
                t.aLoadFromJSONString(str: jsonString)
                array.append(t)
            }
        }
        return array
    }

}
