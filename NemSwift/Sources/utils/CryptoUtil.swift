//
//  CryptoUtil.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/15.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

class CryptoUtil {
    
    private static let PUBLIC_KEY_SIZE = 32
    private static let PRIVATE_KEY_SIZE = 64
    private static let PRIVATE_KEY_SEED_SIZE = 32
    private static let SIGNATURE_SIZE = 64
    
    static func generateKeyPair() -> KeyPair {
        var privateKeySeed: [UInt8] = []
        let nativeSeed = UnsafeMutablePointer<UInt8>.allocate(capacity: PRIVATE_KEY_SEED_SIZE)
        ed25519_create_seed(nativeSeed)
        privateKeySeed = ConvertUtil.toArray(nativeSeed, PRIVATE_KEY_SEED_SIZE)
        
        let privateKey = UnsafeMutablePointer<UInt8>.allocate(capacity: PRIVATE_KEY_SIZE)
        let publicKey = UnsafeMutablePointer<UInt8>.allocate(capacity: PUBLIC_KEY_SIZE)
        
        ed25519_sha3_create_keypair(publicKey, privateKey, ConvertUtil.toNativeArray(privateKeySeed))
        
        let keyPair = KeyPair(publicKey: ConvertUtil.toArray(publicKey, PUBLIC_KEY_SIZE),
                               privateKey: ConvertUtil.toArray(privateKey, PRIVATE_KEY_SIZE),
                               privateKeySeed: privateKeySeed)
        
        print("publicKey: \(keyPair.publicKeyHexString())")
        print("privateKey: \(keyPair.privateKeyHexString())")
        
        return keyPair
    }
}
