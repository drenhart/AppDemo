//
//  PApiNetwork.swift
//  ApiNetwork
//
//  Created by mc Lee on 2022/4/23.
//

import Foundation
import Common
import Alamofire

public class PApiNetwork: IApiNetwork {

    public init() {
        
    }
    
    public func aRequest<T>(_ params: ServerParam, handler: IServerRequestHandler<T>?) where T : IServerModel {
        ServerUtil_Alamofire.fRequest(params, handler: handler)
    }

}
