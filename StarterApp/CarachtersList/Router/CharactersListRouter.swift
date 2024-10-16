//
//  CharactersListRouter.swift
//  StarterApp
//
//  Created by Mina Yousry on 16/10/2024.
//

import Foundation

class CharactersListRouter: BaseRouter<CharatersListRoutes> {
    
    override func performRouting(for route: CharatersListRoutes) {
        switch route {
        case .characterFullPage:
            break
        }
    }
}

enum CharatersListRoutes: BaseRouteProtocol {
    case characterFullPage
}
