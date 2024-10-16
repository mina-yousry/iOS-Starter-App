//
//  CharactersListUserInterfaceProtocol.swift
//  StarterApp
//
//  Created by Mina Yousry on 28/12/2022.
//

import Foundation
import RxSwift

protocol CharactersListUserInterfaceProtocol: AnyObject {
    
    var interActionResponder: CharactersListInterActionResponderProtocol? { get }
    var data: PublishSubject<[CharactersDisplayableEntity]> { get }
    var cellNibName: String { get }
    var cellReuseIdentifier: String { get }
    
    init(interActionResponder: CharactersListInterActionResponderProtocol)
    
    func getScreenTitle() -> String
    func getCharacters()
    func configureCell(cell: CharactersCellProtocol,
                       data: CharactersDisplayableEntity)
    func startLoading(for vc: UIViewController)
    func endLoading(for vc: UIViewController)
}
