//
//  ServerParam.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

open class ServerParam: ServerModel {

    public enum Method {
        case get
        case post
    }

    public var controller: String!
    public var action: String!
    public var parameters = [String: Any]()
    public var method: Method = .get
    public var postBody: String? = nil
    
    public init(post: Bool = false) {
        if post {
            method = .post
        }
    }
    
    public required init() {
        
    }
    
    @discardableResult
    func controller(_ controller: String) -> ServerParam {
        self.controller = controller
        return self
    }
    
    @discardableResult
    func action(_ s : String) -> ServerParam {
        self.action = s
        return self
    }
    
    @discardableResult
    func post() -> ServerParam {
        self.method = .post
        return self
    }
    
    @discardableResult
    func add(_ name: String, value: Any?) -> ServerParam {
        guard let v = value else {
            return self
        }
        parameters[name] = v
        if let _ = v as? ServerParam {
            self.method = .post
        }
        return self
    }
    
    @discardableResult
    func add(value: ServerModel?) -> ServerParam {
        guard let v = value else {
            return self
        }
        method = .post
        if (postBody != nil) {
            fatalError("post method can only one body content")
        }
        postBody = v.aToJSONString()
        return self
    }
    
}
