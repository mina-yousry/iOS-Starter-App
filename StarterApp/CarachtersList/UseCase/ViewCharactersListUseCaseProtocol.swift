//
//  ViewCharactersListUseCaseProtocol.swift
//  StarterApp
//
//  Created by Mina Yousry on 02/01/2023.
//

import Foundation
import RxSwift
import SwiftyMocky

//sourcery: AutoMockable
protocol ViewCharactersListUseCaseProtocol {
    
    func getCharactersList(disposeBag: DisposeBag) -> Observable<MarverCharactersResponseEntity>
}
