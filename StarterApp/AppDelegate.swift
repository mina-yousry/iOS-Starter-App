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
        let repo = CharacterListRepo()
        let useCase = ViewCharactersListUseCase(repo: repo)
        let router = CharactersListRouter(rootViewController: vc)
        let viewModel = CharactersListViewModel(useCase: useCase, router: router)
//        let userInterface = BigCharactersListUserInterface(viewModel: viewModel)
        let userInterface = CharactersListUserInterface(viewModel: viewModel)
        let charactersVc = CharactersListViewController(userInterface: userInterface)
        vc.setViewControllers([charactersVc], animated: true)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
    
    
}

