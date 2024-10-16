//
//  CharactersListUserInterface.swift
//  StarterApp
//
//  Created by Mina Yousry on 28/12/2022.
//

import Foundation
import UIKit
import RxSwift

class CharactersListUserInterface: CharactersListUserInterfaceProtocol {
    
    var cellNibName: String {
        return "CharacterTableViewCell"
    }
    
    var cellReuseIdentifier: String {
        return "CharacterTableViewCell"
    }
    
    var viewModel: CharactersListViewModelProtocol?
    var data = PublishSubject<[CharactersDisplayableEntity]>()
    
    private let disposeBag = DisposeBag()
    
    required init(viewModel: CharactersListViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func getScreenTitle() -> String {
        return "Marvel Characters"
    }
    
    func getCharacters() {
        let obs = self.viewModel?.getCharactersList(size: .thumbnail).share()
        obs?.bind(to: self.data).disposed(by: disposeBag)
    }
    
    func configureCell(cell: CharactersCellProtocol,
                       data: CharactersDisplayableEntity) {
        let cell = cell
        cell.configure(entity: data)
    }
    
    func startLoading(for vc: UIViewController) {
        
    }
    
    func endLoading(for vc: UIViewController) {
        
    }
}
