//
//  MainRouter.swift
//  StarterApp
//
//  Created by Mina Yousry on 17/10/2024.
//

import Foundation

class MainRouter: BaseMainRouter {
    
    func prepareCharactersListScreen() {
        let repo = CharacterListRepo()
        let useCase = ViewCharactersListUseCase(repo: repo)
        let router = CharactersListRouter(rootViewController: rootViewController)
        let viewModel = CharactersListViewModel(useCase: useCase, router: router)
//        let userInterface = BigCharactersListUserInterface(viewModel: viewModel)
        let userInterface = CharactersListUserInterface(viewModel: viewModel)
        let charactersVc = CharactersListViewController(userInterface: userInterface)
        rootViewController.setViewControllers([charactersVc], animated: true)
    }
}
