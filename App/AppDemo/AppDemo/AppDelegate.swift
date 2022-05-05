//
//  AppDelegate.swift
//  AppDemo
//
//  Created by mc Lee on 2022/4/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        AppConfigImpl().connect()
        return true
    }

}

