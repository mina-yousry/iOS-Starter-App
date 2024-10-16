//
//  BaseEntity.swift
//  StarterApp
//
//  Created by Mina Yousry on 29/12/2022.
//

import Foundation

class BaseResponseEntity<T:Codable>: Codable {
    var code: Int?
    var status, copyright, attributionText, attributionHTML: String?
    var etag: String?
    var data: T?

    enum CodingKeys: String, CodingKey {
        case code
        case status
        case copyright
        case attributionText
        case attributionHTML
        case etag
        case data
    }
    
    required init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            code = try values.decodeIfPresent(Int.self, forKey: .code)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
            attributionText = try values.decodeIfPresent(String.self, forKey: .attributionText)
            attributionHTML = try values.decodeIfPresent(String.self, forKey: .attributionHTML)
            etag = try values.decodeIfPresent(String.self, forKey: .etag)
            data = try values.decodeIfPresent(T.self, forKey: .data)
        } catch let err {
            print("bug")
            print(err.localizedDescription)
        }
    }
    
    init(code: Int?, status: String?, copyright: String?, attributionText: String?, attributionHTML: String?, etag: String?, data: T?) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.etag = etag
        self.data = data
    }
}
