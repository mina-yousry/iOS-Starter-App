//
//  BaseUseCase.swift
//  StarterApp
//
//  Created by Mina Yousry on 16/10/2024.
//

import Foundation
import RxRelay
import RxSwift

protocol BaseUseCaseProtocol {
    associatedtype Repo: BaseRepo
    
    var repo: Repo { get }
    var error: PublishRelay<RepoError> { get }
    var isLoading: PublishRelay<Bool> { get }
    var disposeBag: DisposeBag { get }
}

class BaseUseCase <Repo: BaseRepo>: BaseUseCaseProtocol  {
    
    var repo: Repo
    var isLoading = PublishRelay<Bool>()
    var error = PublishRelay<RepoError>()
    let disposeBag = DisposeBag()
    
    init(repo: Repo) {
        self.repo = repo
        repo.isLoading.bind(to: isLoading).disposed(by: disposeBag)
        repo.error.bind(to: error).disposed(by: disposeBag)
    }
}
