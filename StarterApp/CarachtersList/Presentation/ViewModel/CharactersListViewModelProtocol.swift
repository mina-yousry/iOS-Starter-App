//
//  CharactersListInterActionResponderProtocol.swift
//  StarterApp
//
//  Created by Mina Yousry on 01/01/2023.
//

import Foundation
import RxSwift

protocol CharactersListViewModelProtocol: AnyObject {
        
    func getCharactersList(size: ImageSize) -> Observable<[CharactersDisplayableEntity]>
    func routeToCharactersPage(data: CharactersDisplayableEntity)
}
