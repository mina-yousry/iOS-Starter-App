//
//  ViewCharactersListUseCase.swift
//  StarterApp
//
//  Created by Mina Yousry on 02/01/2023.
//

import Foundation
import RxSwift
import SwiftyMocky

class ViewCharactersListUseCase: BaseUseCase<CharacterListRepo>,
                                 ViewCharactersListUseCaseProtocol {
    
    func getCharactersList() -> Observable<MarverCharactersResponseEntity> {
        let req = ListOfCharactersRequest()
        return repo.getCharacters(req: req)
    }
}
