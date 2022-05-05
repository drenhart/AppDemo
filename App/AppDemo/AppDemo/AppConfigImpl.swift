//
//  AppConfigImpl.swift
//  AppDemo
//
//  Created by mc Lee on 2022/4/23.
//

import UIKit
import Common
import ApiModelSerialize
import ApiNetwork

class AppConfigImpl {

    init() {

    }
    
    func connect() {
        Api.pModelSerialize = PApiModelSerialize()
        Api.pNetwork = PApiNetwork()
    }

}
