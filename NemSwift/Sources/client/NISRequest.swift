//
//  NISRequest.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/20.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation
import APIKit

protocol NISRequest: Request {
    
}

extension NISRequest {
    var baseURL: URL {
        return URL(string: "http://23.228.67.85:7890/")!
    }
}

extension NISRequest where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

struct NISError: Error {
    let message: String
    
    init(object: Any) {
        let dictionary = object as? [String: Any]
        message = dictionary?["message"] as? String ?? "Unknown error occurred"
    }
}

extension NISRequest {
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        let res = String(data: object as! Data, encoding: .utf8)
        print(res)
        
        guard 200..<300 ~= urlResponse.statusCode else {
            throw NISError(object: object)
        }
        
        return object
    }
}
