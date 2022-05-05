//
//  ServerParamExtension.swift
//  ApiModelSerialize
//
//  Created by mc Lee on 2022/5/5.
//

import Foundation
import SwiftyJSON
import Common

extension ServerParam: ISwiftyJson {
    
    func dFromJSON(json: JSON) {
        fatalError("not supprt")
    }
    
    func dToJSON() -> JSON {
        if (postBody != nil) {
            if let r = JSON(rawValue: postBody!) {
                return r
            }
        }
        var json = JSON([:])
        for p in self.parameters {
            if let v = p.value as? ISwiftyJson {
                json[p.key] = v.dToJSON()
            } else {
                json[p.key].object = p.value
            }
        }
        return json
    }
    
}
