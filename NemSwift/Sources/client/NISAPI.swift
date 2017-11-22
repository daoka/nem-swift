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
    struct AccountGetForwarded: NISRequest {
        typealias Response = AccountMetaDataPair
        let method: HTTPMethod = .get
        let path: String = "/account/get/forwarded"
        var parameters: Any? {
            return ["address": address]
        }
        
        let address: String
    }
    
    // 3.1.3 Requesting the original account data for a delegate account from public key
    struct AccountGetForwardedFromPublicKey: NISRequest {
        typealias Response = AccountMetaDataPair
        let method: HTTPMethod = .get
        let path: String = "/account/get/from-public-key"
        var parameters: Any? {
            return ["publicKey": publicKey]
        }
        
        let publicKey: String
    }
    
    // 3.1.4 Requesting the account status
    struct AccountStatus: NISRequest {
        typealias Response = AccountMetaData
        let method: HTTPMethod = .get
        let path: String = "/account/get/forwarded"
        var parameters: Any? {
            return ["address": address]
        }
        
        let address: String
    }
    
    // 3.1.5 Requesting transaction data for an account
    struct AccountTransfersIncoming: NISRequest {
        typealias Response = TransactionMetaDataPairs
        let method: HTTPMethod = .get
        let path: String = "/account/transfers/incoming"
        var parameters: Any? {
            var params = ["address": address]
            if let hash = hash {
                params["hash"] = hash
            }
            if let id = id {
                params["id"] = id
            }
            return params
        }
        
        let address: String
        let hash: String?
        let id: String?
    }
    
    struct AccountTransfersOutgoin: NISRequest {
        typealias Response = TransactionMetaDataPairs
        let method: HTTPMethod = .get
        let path: String = "/account/transfers/outgoing"
        var parameters: Any? {
            var params = ["address": address]
            if let hash = hash {
                params["hash"] = hash
            }
            if let id = id {
                params["id"] = id
            }
            return params
        }
        
        let address: String
        let hash: String?
        let id: String?
    }
    
    struct AccountTransfersAll: NISRequest {
        typealias Response = TransactionMetaDataPairs
        let method: HTTPMethod = .get
        let path: String = "/account/transfers/all"
        var parameters: Any? {
            var params = ["address": address]
            if let hash = hash {
                params["hash"] = hash
            }
            if let id = id {
                params["id"] = id
            }
            return params
        }
        
        let address: String
        let hash: String?
        let id: String?
    }
    
    struct AccountUnconfirmedTransactions: NISRequest {
        typealias Response = UnconfirmedTransactionMetaDataPairs
        let method: HTTPMethod = .get
        let path: String = "/account/unconfirmedTransactions"
        var parameters: Any? {
            return ["address": address]
        }
        
        let address: String
    }
}
