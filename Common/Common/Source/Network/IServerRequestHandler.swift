//
//  IServerRequestHandler.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

public struct IServerRequestHandler<T: IServerModel> {
    public let pSuccess: ((_ data: T) -> Void)?
    public let pFail: ((_ failInfo: RequestFailInfo<T>?) -> Void)?
    
    public init(_ success: @escaping ((_ data: T) -> Void), fail: ((_ failInfo: RequestFailInfo<T>?) -> Void)?) {
        pSuccess = success
        pFail = fail
    }
}

open class RequestFailInfo<T: IServerModel> {
    open var pError: Error?
    open var pResponse: CommonResponse<T>?
    
    public init(_ error: Error?, _ response: CommonResponse<T>?) {
        pError = error
        pResponse = response
    }
}
