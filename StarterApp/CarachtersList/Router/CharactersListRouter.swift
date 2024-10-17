//
//  CharactersListRouter.swift
//  StarterApp
//
//  Created by Mina Yousry on 16/10/2024.
//

import Foundation
import UIKit

class CharactersListRouter: BaseRouter<CharatersListRoutes> {
    
    var charactersListVc: UIViewController?
    
    override func performRouting(for route: CharatersListRoutes) {
        switch route {
        case .characterFullPage(let data):
            guard let charactersListVc = charactersListVc else { return }
            let router = CharacterFullPageRouter(vc: charactersListVc, entity: data)
            router.start()
        }
    }
}

enum CharatersListRoutes: BaseRouteProtocol {
    case characterFullPage(data: CharactersDisplayableEntity)
}
