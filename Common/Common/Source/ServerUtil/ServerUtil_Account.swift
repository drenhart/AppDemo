//
//  ServerUtil_Account.swift
//  Common
//
//  Created by mc Lee on 2022/4/23.
//

import Foundation
import UIKit

open class ServerUtil_Account {

    private static let c_Controller = "Account"
    
    public static func Login(loginParam: LoginParam, handler: IServerRequestHandler<MyProfile>?) {
        let param = ServerParam(post: true)
            .controller(c_Controller)
            .action("Login")
            .add(value: loginParam)
        Api.pNetwork.aRequest(param, handler: handler)
    }

}
