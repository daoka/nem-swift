//
//  KeyPair.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/15.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct KeyPair {
    let publicKey: [UInt8]
    let privateKey: [UInt8]
    let privateKeySeed: [UInt8]
    
    func publicKeyHexString() -> String {
        return ConvertUtil.toHexString(publicKey)
    }
    
    func privateKeyHexString() -> String {
        return ConvertUtil.toHexString(privateKey)
    }
}
