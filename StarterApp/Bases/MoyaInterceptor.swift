//
//  MoyaInterceptor.swift
//  StarterApp
//
//  Created by Mina Yousry on 04/01/2023.
//

import Moya

final class MoyaInterceptor: PluginType {
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        return request
    }

    func willSend(_ request: RequestType, target: TargetType) {

    }

    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {

    }
}
