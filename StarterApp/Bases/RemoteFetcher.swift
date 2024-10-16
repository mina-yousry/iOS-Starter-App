//
//  OnlineFetcher.swift
//
//  Created by Mina Yousry on 26/12/2022.
//

import Foundation
import RxSwift
import Moya
import Reachability

class RemoteFetcher<E: Codable, R: BaseResponseEntity<E>> {
    
    static func getRemoteResponse<T: BaseTarget>(request: BaseRemoteRequest<T>)
    -> Observable<R> {
        return Observable<R>.create { observer in
            request.provider.request(request.requset) { result in
                switch result {
                case .success(let response):
                    let decoder: JSONDecoder = JSONDecoder()
                    do {
                        let decodedResponse = try decoder.decode(R.self, from: response.data)
                        observer.onNext(decodedResponse)
                    } catch let err {
                        print(err.localizedDescription)
                        observer.onError(RepoError.parsing)
                    }
                case .failure(let error):
                    if let statusCode = error.response?.statusCode {
                        switch statusCode {
                        case 500:
                            observer.onError(RepoError.server)
                        default:
                            observer.onError(RepoError.generic)
                        }
                    } else {
                        observer.onError(RepoError.generic)
                    }
                }
            }
            return Disposables.create()
        }
    }
}


