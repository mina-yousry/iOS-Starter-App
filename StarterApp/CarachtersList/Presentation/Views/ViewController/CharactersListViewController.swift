//
//  CharactersListViewController.swift
//  StarterApp
//
//  Created by Mina Yousry on 28/12/2022.
//

import UIKit
import RxSwift
import RxCocoa

class CharactersListViewController: UIViewController {
    
    @IBOutlet weak var charactersUITableView: UITableView!
    
    private let disposeBag = DisposeBag()
    private var userInterface: CharactersListUserInterfaceProtocol?
        
    init(userInterface: CharactersListUserInterfaceProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.userInterface = userInterface
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = userInterface?.getScreenTitle()
        self.configureTableView()
        self.bindUserInterface()
        self.userInterface?.getCharacters()
    }
    
    private func configureTableView() {
        self.charactersUITableView
            .register(UINib(nibName: userInterface?.cellNibName ?? "",
                            bundle: nil),
                      forCellReuseIdentifier: userInterface?.cellReuseIdentifier ?? "")
        self.charactersUITableView.rowHeight = UITableView.automaticDimension
    }
    
    private func bindUserInterface() {
        self.userInterface?.data
            .bind(to: self.charactersUITableView.rx.items(cellIdentifier: userInterface?.cellReuseIdentifier ?? "")) { [weak self] (_, item, cell) in
                guard let uiCell = cell as? CharactersCellProtocol else { return }
                self?.userInterface?.configureCell(cell: uiCell, data: item)
            }.disposed(by: disposeBag)
    }
}
