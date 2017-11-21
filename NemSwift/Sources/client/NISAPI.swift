//
//  NISAPI.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/21.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation
import APIKit

final class NISAPI {
    private init() {}
    
    // 3.1.2 Requesting the account data
    struct AccountGet: NISRequest {
        typealias Response = AccountMetaDataPair
        let method: HTTPMethod = .get
        let path: String = "/account/get"
        var parameters: Any? {
            return ["address": address]
        }
        
        let address: String
    }
    
    // 3.1.2 Requesting the account data from public key
    struct AccountGetFromPublicKey: NISRequest {
        typealias Response = AccountMetaDataPair
        let method: HTTPMethod = .get
        let path: String = "/account/get/from-public-key"
        var parameters: Any? {
            return ["publicKey": publicKey]
        }
        
        let publicKey: String
    }
    
    // 3.1.3 Requesting the original account data for a delegate account
    struct AccountGetForwarded {
        typealias Response = AccountMetaDataPair
        let method: HTTPMethod = .get
        let path: String = "/account/get/forwarded"
        var parameters: Any? {
            return ["address": address]
        }
        
        let address: String
    }
    
    // 3.1.3 Requesting the original account data for a delegate account from public key
    struct AccountGetForwardedFromPublicKey {
        typealias Response = AccountMetaDataPair
        let method: HTTPMethod = .get
        let path: String = "/account/get/from-public-key"
        var parameters: Any? {
            return ["publicKey": publicKey]
        }
        
        let publicKey: String
    }
    
    // 3.1.4 Requesting the account status
    struct AccountStatus {
        typealias Response = AccountMetaData
        let method: HTTPMethod = .get
        let path: String = "/account/get/forwarded"
        var parameters: Any? {
            return ["address": address]
        }
        
        let address: String
    }
}
