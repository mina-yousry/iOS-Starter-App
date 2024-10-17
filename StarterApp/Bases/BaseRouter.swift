//
//  BaseCoordinator.swift
//
//  Created by Mina Yousry on 26/12/2022.
//

import Foundation
import RxRelay
import RxSwift

protocol MainRouterProtocol: AnyObject {
    var rootViewController: UINavigationController { get set }
}

class BaseMainRouter: MainRouterProtocol {
    
    var rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
}

protocol BaseRouterProtocol: MainRouterProtocol {
    associatedtype RouterType
    var navigator: PublishRelay<RouterType> { get set }
    var disposeBag: DisposeBag { get set }
    func close()
    func performRouting(for route: RouterType)
}

class BaseRouter<RouteType: BaseRouteProtocol>: BaseMainRouter, BaseRouterProtocol {
    
    var navigator = PublishRelay<RouteType>()
    var disposeBag = DisposeBag()
    
    override init(rootViewController: UINavigationController) {
        super.init(rootViewController: rootViewController)
        self.navigator.subscribe(onNext: { [weak self] router in
            self?.performRouting(for: router)
        }).disposed(by: disposeBag)
    }
    
    func performRouting(for route: RouteType) {}
    func close() {}
}

protocol BaseRouteProtocol {}
