//
//  BigCharactersListUserInterface.swift
//  StarterApp
//
//  Created by Mina Yousry on 10/01/2023.
//

import Foundation
import RxSwift

class BigCharactersListUserInterface: CharactersListUserInterfaceProtocol {
    var cellNibName: String {
        return "BigCharacterTableViewCell"
    }
    
    var cellReuseIdentifier: String {
        return "BigCharacterTableViewCell"
    }
    
    var viewModel: CharactersListViewModelProtocol?
    var data = PublishSubject<[CharactersDisplayableEntity]>()
    
    private let disposeBag = DisposeBag()
    
    required init(viewModel: CharactersListViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func getScreenTitle() -> String {
        return "Big Marvel Characters"
    }
    
    func getCharacters() {
        let obs = self.viewModel?.getCharactersList(size: .landscape).share()
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
