//
//  MoyaProviderFactory.swift
//  StarterApp
//
//  Created by Mina Yousry on 04/01/2023.
//

import Foundation
import Moya
import SwiftUI

enum ProviderEnvironment {
    case online
    case local(delay: TimeInterval = 0)
}

class MoyaPrviderFactory<T: BaseTarget> {
    typealias ProviderType = MoyaProvider<T>
    
    func create(env: ProviderEnvironment = .online) -> ProviderType {
        // If XCTests are running use the local source
//        if NSClassFromString("XCTest") != nil {
//            return createLocalProvider(delay: 0)
//        } else {
//            switch env {
//            case .online:
//                return createOnlineProvider()
//            case .local(let delay):
//                return createLocalProvider(delay: delay)
//            }
//        }
        return createOnlineProvider()
    }
    
    func createLocalProvider(delay: TimeInterval) -> ProviderType {
        
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(),
            MoyaInterceptor()
        ]
        let provider = ProviderType(stubClosure: MoyaProvider.delayedStub(delay), plugins: plugins)
        return provider
    }
    
    func createOnlineProvider() -> ProviderType {
        var plugins: [PluginType] = [
            MoyaInterceptor()
        ]
            plugins.append(NetworkLoggerPlugin())
        return ProviderType(plugins: plugins)
    }
}
