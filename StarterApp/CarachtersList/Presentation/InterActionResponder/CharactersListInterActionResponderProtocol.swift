//
//  CharactersListInterActionResponderProtocol.swift
//  StarterApp
//
//  Created by Mina Yousry on 01/01/2023.
//

import Foundation
import RxSwift

protocol CharactersListInterActionResponderProtocol: AnyObject {
        
    var charactersListUserInterface: CharactersListUserInterfaceProtocol? { get set }
    func getCharactersList(size: ImageSize) -> Observable<[CharactersDisplayableEntity]> 
}
