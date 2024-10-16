//
//  CharactersListInterActionResponder.swift
//  StarterApp
//
//  Created by Mina Yousry on 01/01/2023.
//

import Foundation
import RxSwift

class CharactersListViewModel: BaseViewModel<CharacterListRepo,
                                ViewCharactersListUseCase,
                                CharatersListRoutes,
                                CharactersListRouter>,
                               CharactersListViewModelProtocol {
        
    func getCharactersList(size: ImageSize) -> Observable<[CharactersDisplayableEntity]> {
        let obs = useCase.getCharactersList().share()
        return obs.map{ [weak self] charactersList in
            return self?.mapToDisplayableEntity(charactersList.data?.results ?? [], size: size) ?? []
        }
    }
    
    private func mapToDisplayableEntity(_ data: [MarvelCharacter], size: ImageSize) -> [CharactersDisplayableEntity] {
        return data.map({ character in
            return CharactersDisplayableEntity(character: character, size: size)
        })
    }
    
    deinit {
        print("deinit: CharactersListViewModel")
    }
}
