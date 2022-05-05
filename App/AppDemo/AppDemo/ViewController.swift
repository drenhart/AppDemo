//
//  ViewController.swift
//  AppDemo
//
//  Created by mc Lee on 2022/4/20.
//

import UIKit
import Common

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginClick(_ sender: UIButton) {
        let loginParam = LoginParam(loginName: "6412825", password: "403166")
        ServerUtil_Account.Login(loginParam: loginParam, handler: IServerRequestHandler<MyProfile>({data in
            print(data.Member?.NickName)
        }, fail: { (failInfo) in
            
        }))
    }
    
}

