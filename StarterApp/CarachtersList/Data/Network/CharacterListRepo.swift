//
//  CharacterListRepo.swift
//  StarterApp
//
//  Created by Mina Yousry on 16/10/2024.
//

import RxSwift

class CharacterListRepo: BaseRepo {
    
    func getCharacters(req: ListOfCharactersRequest) -> Observable<MarverCharactersResponseEntity> {
        return RemoteFetcher<MarvelCharactersDataEntity,
                                MarverCharactersResponseEntity>.getRemoteResponse(request: req).share()
    }
}
