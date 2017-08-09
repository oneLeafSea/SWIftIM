//
//  IMAppDelegate.swift
//  SwiftIM
//
//  Created by 冯学仕 on 17/7/20.
//  Copyright © 2017年 rooten. All rights reserved.
//


import UIKit

@UIApplicationMain
class IMAppDelegate: UIResponder ,UIApplicationDelegate {
    var window: UIWindow?
    var appUsr: User?
    var mainVc: UIViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        initUser()
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "mainViewControllerStoryBoard", bundle: nil)
        let tabVC = mainStoryboard.instantiateViewController(withIdentifier: "main") as! UITabBarController
        mainVc = (appUsr?.getUser())! ? tabVC:LoginViewController()
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.clear
        self.window?.rootViewController = mainVc
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func initUser()
    {
        appUsr = User.init()
    }

}
