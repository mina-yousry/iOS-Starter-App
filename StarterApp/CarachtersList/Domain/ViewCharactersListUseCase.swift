//
//  ViewCharactersListUseCase.swift
//  StarterApp
//
//  Created by Mina Yousry on 02/01/2023.
//

import Foundation
import RxSwift
import SwiftyMocky

class ViewCharactersListUseCase: ViewCharactersListUseCaseProtocol {
    
    func getCharactersList(disposeBag: DisposeBag) -> Observable<MarverCharactersResponseEntity> {
        let req = ListOfCharactersRequest()
        let obs = RemoteFetcher<MarvelCharactersDataEntity,
                                MarverCharactersResponseEntity>.getRemoteResponse(request: req).share()
        return obs
    }
}
