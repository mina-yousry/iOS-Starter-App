//
//  CharacterFullPageViewController.swift
//  StarterApp
//
//  Created by Mina Yousry on 17/10/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class CharacterFullPageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var discribtion: UILabel!
    
    var userInterface: CharactersFullPageUserInterfaceProtocol?
    private let disposeBag = DisposeBag()
    
    init(userInterface: CharactersFullPageUserInterfaceProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.userInterface = userInterface
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUserInterface()
    }
    
    private func bindUserInterface() {
        userInterface?.title.bind(to: self.rx.title).disposed(by: disposeBag)
        userInterface?.name.bind(to: self.name.rx.text).disposed(by: disposeBag)
        userInterface?.discription.bind(to: self.discribtion.rx.text).disposed(by: disposeBag)
        userInterface?.imageUrl.asDriver().drive(onNext: { [weak self] url in
            guard let self = self else { return }
            self.imageView.kf.setImage(with: URL(string: url))
        }).disposed(by: disposeBag)
    }
    

}
