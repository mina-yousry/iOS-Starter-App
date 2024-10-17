//
//  CharacterFullPageRouter.swift
//  StarterApp
//
//  Created by Mina Yousry on 17/10/2024.
//
import UIKit

class CharacterFullPageRouter: CharacterFullPageRouterProtocol {
    
    var rootVC: UIViewController
    var entity: CharactersDisplayableEntity
    
    init(vc: UIViewController, entity: CharactersDisplayableEntity) {
        self.rootVC = vc
        self.entity = entity
    }
    
    func start() {
        let userInterface = CharactersFullPageUserInterface(entity: entity)
        let charaterVC = CharacterFullPageViewController(userInterface: userInterface)
        rootVC.navigationController?.pushViewController(charaterVC, animated: true)
    }
}
