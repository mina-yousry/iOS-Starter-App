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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UINavigationController()
        let interActionResponder = CharactersListInterActionResponder()
        let userInterface = BigCharactersListUserInterface(interActionResponder: interActionResponder)
//        let userInterface = CharactersListUserInterface(interActionResponder: interActionResponder)
        interActionResponder.charactersListUserInterface = userInterface
        let charactersVc = CharactersListViewController(userInterface: userInterface,
                                                        interactionResponder: interActionResponder)
        vc.setViewControllers([charactersVc], animated: true)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }


}

