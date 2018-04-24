//
//  AppDelegate.swift
//  Fweeeeet
//
//  Created by Miyoshi Masataka on 2018/04/24.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController())
        // Firebase
        FirebaseApp.configure()
        return true
    }

}




















