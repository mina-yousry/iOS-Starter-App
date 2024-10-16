//
//  BaseViewModel.swift
//
//  Created by Mina Yousry on 26/12/2022.
//

import Foundation
import RxRelay
import RxSwift

protocol ViewModelType: AnyObject {
    
    var isLoading: BehaviorRelay<Bool> { get }
    var error: PublishRelay<RepoError> { get }
    func close()
    func handleError(_ error: RepoError)
    func handleBackendError(code: Int, body: [String: Any], name: String)
    
}

class BaseViewModel<Repo: BaseRepo,
                    UseCaseType: BaseUseCase<Repo>,
                    RouteType: BaseRouteProtocol,
                    RouterType: BaseRouter<RouteType>>: ViewModelType {
    
    var useCase: UseCaseType
    weak var router: RouterType?
    var isLoading = BehaviorRelay<Bool>(value: false)
    var navigator = PublishRelay<RouteType>()
    var error = PublishRelay<RepoError>()
    let disposeBag = DisposeBag()
    
    required init(useCase: UseCaseType, router: RouterType?) {
        self.useCase = useCase
        self.router = router
        let useCaseDisposeBag = self.useCase.disposeBag
        self.useCase.isLoading.bind(to: self.isLoading).disposed(by: useCaseDisposeBag)
        self.useCase.error.bind(to: self.error).disposed(by: useCaseDisposeBag)
        self.useCase.error.subscribe(onNext: { [weak self] error in
            self?.handleError(error)
        }).disposed(by: useCaseDisposeBag)
        if let navigator = router?.navigator {
            self.navigator.bind(to: navigator).disposed(by: disposeBag)
        }
    }
    
    func close() {
        self.router?.close()
    }
    
    func handleError(_ error: RepoError) {}
    
    func handleBackendError(code: Int, body: [String: Any], name: String) {}
}
