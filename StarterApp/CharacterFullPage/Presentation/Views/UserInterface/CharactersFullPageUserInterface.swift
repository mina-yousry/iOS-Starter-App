//
//  CharactersFullPageUserInterface.swift
//  StarterApp
//
//  Created by Mina Yousry on 17/10/2024.
//
import RxSwift
import RxRelay

class CharactersFullPageUserInterface: CharactersFullPageUserInterfaceProtocol {

    var imageUrl = BehaviorRelay<String>(value: "")
    var name = BehaviorRelay<String>(value: "")
    var discription = BehaviorRelay<String>(value: "")
    var title = BehaviorRelay<String>(value: "")
    
    init (entity: CharactersDisplayableEntity) {
        imageUrl.accept(entity.thumbnailUrl ?? "")
        name.accept(entity.name ?? "")
        discription.accept(entity.resultDescription ?? "")
        title.accept(entity.name ?? "")
    }
}
