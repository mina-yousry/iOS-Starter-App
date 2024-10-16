//
//  CharactersListDisplayableEntity.swift
//  StarterApp
//
//  Created by Mina Yousry on 29/12/2022.
//

import Foundation

class CharactersDisplayableEntity {
    var name, resultDescription: String?
    var thumbnailUrl: String?
    
    init(character: MarvelCharacter,
         size: ImageSize) {
        self.name = character.name
        self.resultDescription = character.description
        let url = (character.thumbnail?.path ?? "") + size.rawValue + (character.thumbnail?.thumbnailExtension ?? "")
        self.thumbnailUrl = url
    }
}


enum ImageSize: String {
    case thumbnail = "/standard_medium."
    case fullSize = "."
    case landscape = "/landscape_amazing."
}
