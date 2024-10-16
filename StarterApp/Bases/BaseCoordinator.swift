//
//  BaseCoordinator.swift
//
//  Created by Mina Yousry on 26/12/2022.
//

import Foundation
import RxRelay
import RxSwift

protocol BaseCoordinatorProtocol: AnyObject {
    associatedtype RouterType
    var router: PublishRelay<RouterType> { get set }
    var disposeBag: DisposeBag { get set }
    var rootViewController: UINavigationController { get set }
    func close()
    func performRouting(for route: RouterType)
}

class BaseCoordinator<RouteType: BaseRouterProtocol>: BaseCoordinatorProtocol {
    
    var rootViewController: UINavigationController
    var router = PublishRelay<RouteType>()
    var disposeBag = DisposeBag()
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        self.router.subscribe(onNext: { [weak self] router in
            self?.performRouting(for: router)
        }).disposed(by: disposeBag)
    }
    
    func performRouting(for router: RouteType) {}
    func close() {}
}

protocol BaseRouterProtocol {}
