//
//  KoinzRequest.swift
//
//  Created by Mina Yousry on 26/12/2022.
//

import Foundation
import Moya

class BaseRemoteRequest <T: BaseTarget> {
    
    var requset: T
    var provider: MoyaProvider<T>
    
    init(requset: T,
         provider: MoyaProvider<T>) {
        self.requset = requset
        self.provider = provider
    }
}

protocol BaseTarget: TargetType {}
