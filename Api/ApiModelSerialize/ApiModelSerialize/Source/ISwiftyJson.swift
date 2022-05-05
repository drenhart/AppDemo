//
//  ISwiftyJson.swift
//  Alamofire
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation
import SwiftyJSON
import Common

protocol ISwiftyJson {
    init()
    
    mutating func dFromJSON(json: JSON)
    func dToJSON() -> JSON
}

extension Int: ISwiftyJson {
    mutating func dFromJSON(json: JSON) {
        self = json.intValue
    }
    
    func dToJSON() -> JSON {
        var json = JSON()
        json.intValue = self
        return json
    }
}

extension Int32: ISwiftyJson {
    mutating func dFromJSON(json: JSON) {
        self = Int32(json.intValue)
    }
    
    func dToJSON() -> JSON {
        var json = JSON()
        json.intValue = Int(self)
        return json
    }
}

extension String: ISwiftyJson {
    mutating func dFromJSON(json: JSON) {
        self = json.stringValue
    }
    
    func dToJSON() -> JSON {
        var json = JSON()
        json.string = self
        return json
    }
}

extension Array : ISwiftyJson where Element : ISwiftyJson {
    mutating func dFromJSON(json: JSON) {
        for j in json.arrayValue {
            var t = Element()
            t.dFromJSON(json: j)
            self.append(t)
        }
    }
    
    func dToJSON() -> JSON {
        var jsonArray = [Any]()
        for a in self {
            jsonArray.append(a.dToJSON().rawValue)
        }
        return JSON(jsonArray)
    }
}

extension Dictionary : ISwiftyJson where Key == String, Value : ISwiftyJson {
    mutating func dFromJSON(json: JSON) {
        let j = json.dictionaryValue
        for i in j {
            var t = Value()
            t.dFromJSON(json: i.1)
            self[i.0] = t
        }
    }
    
    func dToJSON() -> JSON {
        var j: JSON? = nil
        for i in self {
            if (j == nil) {
                j = JSON([i.0 : i.1.dToJSON()])
            } else {
                j![i.0] = i.1.dToJSON()
            }
        }
        return j ?? JSON([:])
    }
}

extension ServerCounter: ISwiftyJson {
    func dFromJSON(json: JSON) {
        Count = json["Count"].intValue
    }
    
    func dToJSON() -> JSON {
        var json = JSON()
        json["Count"].int = Count
        return json
    }
}

extension JSON {
    func fToArray<T>() -> [T]? where T: ISwiftyJson {
        if self == JSON.null {
            return nil
        }
        var array = [T]()
        for j in self.arrayValue {
            var t = T()
            t.dFromJSON(json: j)
            array.append(t)
        }
        return array.isEmpty ? nil : array
    }
    
    func fToArrayOrDefault<T>() -> [T] where T: ISwiftyJson {
        var array = [T]()
        for j in self.arrayValue {
            var t = T()
            t.dFromJSON(json: j)
            array.append(t)
        }
        return array
    }
    
    func fToArray() -> [Gender]? {
        if self == JSON.null {
            return nil
        }
        var array = [Gender]()
        for j in self.arrayValue {
            array.append(Gender(rawValue: j.intValue)!)
        }
        return array
    }
    
    func fToObject<T>() -> T? where T: ISwiftyJson {
        if self == JSON.null {
            return nil
        }
        var obj = T()
        obj.dFromJSON(json: self)
        return obj
    }
    
    func fToDate() -> Date? {
        if self == JSON.null {
            return nil
        }
        if let d = FormatUtil.pISODateFormatter.date(from: self.stringValue) {
            return d
        } else {
            if let d = FormatUtil.pISODateFormatter2.date(from: self.stringValue) {
                return d
            } else {
                fatalError("wrong date format \(self.stringValue)")
            }
            
        }
    }
    
    func fToDictionary<V>() -> [String : V]? where V : ISwiftyJson {
        if self == JSON.null {
            return nil
        }
        var dict = [String: V]()
        for j in self.dictionaryValue {
            let v: V = j.value.fToObject()!
            dict[j.key] = v
        }
        return dict
    }
    
}
