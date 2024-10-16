//
//  CharactersApi.swift
//  StarterApp
//
//  Created by Mina Yousry on 03/01/2023.
//

import Foundation
import Moya

enum CharactersApi {
    case getCharacters
}

extension CharactersApi: BaseTarget {

    var baseURL: URL {
        return URL(string: "https://gateway.marvel.com:443/v1/public")!
    }

    var path: String {
        switch self {
        case .getCharacters:
            return "/characters"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getCharacters:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getCharacters:
            let parameters = ApiHelper.shared.getBaseApiParameters()
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type" : "application/json"]
    }
    
}
 

