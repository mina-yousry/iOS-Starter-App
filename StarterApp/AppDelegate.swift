//
//  AppDelegate.swift
//  StarterApp
//
//  Created by Mina Yousry on 25/12/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let mainRootVC = UINavigationController()
    var mainRouter: MainRouter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        mainRouter = MainRouter(rootViewController: mainRootVC)
        mainRouter?.prepareCharactersListScreen()
        window?.rootViewController = mainRootVC
        window?.makeKeyAndVisible()
        return true
    }
    
    
}

