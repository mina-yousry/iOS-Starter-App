//
//  CharactersFullPageUserInterfaceProtocol.swift
//  StarterApp
//
//  Created by Mina Yousry on 17/10/2024.
//
import RxSwift
import RxRelay

protocol CharactersFullPageUserInterfaceProtocol {
    
    var imageUrl: BehaviorRelay<String> { get set }
    var name: BehaviorRelay<String> { get set }
    var discription: BehaviorRelay<String> { get set }
    var title: BehaviorRelay<String> { get set }
}
