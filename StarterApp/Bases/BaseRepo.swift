//
//  BaseRepo.swift
//
//  Created by Mina Yousry on 26/12/2022.
//

import Foundation
import RxRelay
import RxSwift

protocol BaseRepoProtocol: AnyObject {
    var error: PublishRelay<RepoError> { get }
    var isLoading: PublishRelay<Bool> { get }
    var disposeBag: DisposeBag { get }
}

class BaseRepo {
    var error = PublishRelay<RepoError>()
    var isLoading = PublishRelay<Bool>()
    let disposeBag = DisposeBag()
    
    required init() {}
}
