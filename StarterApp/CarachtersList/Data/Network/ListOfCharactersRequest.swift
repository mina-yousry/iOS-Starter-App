//
//  ListOfCharactersRequest.swift
//  StarterApp
//
//  Created by Mina Yousry on 03/01/2023.
//

import Foundation

class ListOfCharactersRequest: BaseRemoteRequest<CharactersApi> {
    
    init () {
        let request = CharactersApi.getCharacters
        let charactersAPIProvider = MoyaPrviderFactory<CharactersApi>().create()
        super.init(requset: request, provider: charactersAPIProvider)
    }
}
