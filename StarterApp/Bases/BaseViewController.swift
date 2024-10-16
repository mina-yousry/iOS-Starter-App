//
//  BaseViewController.swift
//
//  Created by Mina Yousry on 26/12/2022..
//

import UIKit
import RxSwift
import Action
import RxCocoa

class BaseViewController<T: ViewModelType>: UIViewController, BindableType {
    
    typealias ViewModel = T
    
    //MARK: - Global Variables
    var viewModel: T?
    let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Class Methods
    func initializeViews() {}
    
    func bindViewModel() {
        self.bindLoadingLogic()
    }
    
    func postDismissAction() {}
    
    func startLoading() {
        startProgressAnimation()
    }
    
    func endLoading() {
        stopProgressAnimation()
    }
    
    func handleError(_ error: RepoError) {}
    
    // MARK: - Private Methods
    private func bindLoadingLogic() {
        viewModel?.isLoading.asDriver(onErrorJustReturn: false)
        .drive(onNext: { [weak self] isLoading in
            if isLoading {
                self?.startLoading()
            } else {
                self?.endLoading()
            }
        }, onCompleted: { [weak self] in
            self?.endLoading()
        }, onDisposed: { [weak self] in
            self?.endLoading()
        }).disposed(by: disposeBag)
        
        viewModel?.error.subscribe(onNext: { [weak self] error in
            self?.handleError(error)
        }).disposed(by: disposeBag)
    }
}
