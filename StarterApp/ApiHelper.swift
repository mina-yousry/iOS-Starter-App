//
//  ApiHelper.swift
//  StarterApp
//
//  Created by Mina Yousry on 04/01/2023.
//

import Foundation
import CryptoSwift

class ApiHelper {
    
    static let shared = ApiHelper()
    
    private init() {}
    
    private func getPublicApiKey() -> String {
        let publicKey = Bundle.main.object(forInfoDictionaryKey: InfoPlistKeys.PUBLIC_KEY) as? String
        return publicKey ?? ""
    }
    
    private func getPrivateApiKey() -> String {
        let privateKey = Bundle.main.object(forInfoDictionaryKey: InfoPlistKeys.PRIVATE_KEY) as? String
        return privateKey ?? ""
    }
    
    func getBaseApiParameters() -> [String: Any] {
        let publicKey = self.getPublicApiKey()
        let timeStamp = self.getTimeStamp()
        let hash = self.getApiHash(timestamp: timeStamp)
        let parameters = [
            ApiKeys.TIME_STAMP : timeStamp,
            ApiKeys.API_KEY : publicKey,
            ApiKeys.HASH : hash
        ]
        return parameters
    }
    
    private func getTimeStamp() -> String {
        let timestamp = Date().timeIntervalSince1970
        let formatter = DateFormatter()
        return String(timestamp)
    }
    
    private func getApiHash(timestamp: String) -> String {
        let stringToBeHashed = timestamp + self.getPrivateApiKey() + self.getPublicApiKey()
        return stringToBeHashed.md5()
    }
}

class InfoPlistKeys {
    static let PUBLIC_KEY = "PUBLIC_API_KEY"
    static let PRIVATE_KEY = "PRIVATE_API_KEY"
}

class ApiKeys {
    static let API_KEY = "apikey"
    static let TIME_STAMP = "ts"
    static let HASH = "hash"
}
