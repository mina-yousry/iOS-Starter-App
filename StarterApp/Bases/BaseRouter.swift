//
//  BaseCoordinator.swift
//
//  Created by Mina Yousry on 26/12/2022.
//

import Foundation
import RxRelay
import RxSwift

protocol BaseRouterProtocol: AnyObject {
    associatedtype RouterType
    var navigator: PublishRelay<RouterType> { get set }
    var disposeBag: DisposeBag { get set }
    var rootViewController: UINavigationController { get set }
    func close()
    func performRouting(for route: RouterType)
}

class BaseRouter<RouteType: BaseRouteProtocol>: BaseRouterProtocol {
    
    var rootViewController: UINavigationController
    var navigator = PublishRelay<RouteType>()
    var disposeBag = DisposeBag()
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigator.subscribe(onNext: { [weak self] router in
            self?.performRouting(for: router)
        }).disposed(by: disposeBag)
    }
    
    func performRouting(for route: RouteType) {}
    func close() {}
}

protocol BaseRouteProtocol {}
