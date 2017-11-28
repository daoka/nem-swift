//
//  RequestAnnounce.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/22.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct RequestAnnounce: Codable {
    let data: String
    let signature: String
    
    public func toJsonString() -> String {
        let data = try! JSONEncoder().encode(self)
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        
        let jsonStr = String(data: data, encoding: .utf8)
        
        print(">>> json: \(jsonStr!)")
        
        return jsonStr!
    }
    
    static func generateRequestAnnounce(requestAnnounce: [UInt8], keyPair:KeyPair) -> RequestAnnounce {
        let signatureBytes = keyPair.sign(message: requestAnnounce)
        let data = ConvertUtil.toHexString(requestAnnounce)
        let signature = ConvertUtil.toHexString(signatureBytes)
        return RequestAnnounce(data: data, signature: signature)
    }
}
