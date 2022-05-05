//
//  IApiNetwork.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation
import UIKit

public protocol IApiNetwork {
    func aRequest<T>(_ params: ServerParam, handler: IServerRequestHandler<T>?) where T: IServerModel
}
