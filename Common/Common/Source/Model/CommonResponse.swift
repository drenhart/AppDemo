//
//  CommonResponse.swift
//  Common
//
//  Created by mc Lee on 2022/4/21.
//

import Foundation

open class CommonResponse<T: IServerModel>: ServerModel {
    open var StatusCode: EResponseStatusCode = .eUnknownRequest
    open var Msg: String?
    open var Data: T?
}
