//
//  KeyPair.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/15.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct KeyPair {
    
    private static let PUBLIC_KEY_SIZE = 32
    private static let PRIVATE_KEY_SIZE = 64
    private static let PRIVATE_KEY_SEED_SIZE = 32
    private static let SIGNATURE_SIZE = 64
    
    let publicKey: [UInt8]
    let privateKey: [UInt8]
    let privateKeySeed: [UInt8]
    
    func publicKeyHexString() -> String {
        return ConvertUtil.toHexString(publicKey)
    }
    
    func privateKeyHexString() -> String {
        return ConvertUtil.toHexString(privateKey)
    }
    
    func importKey() -> String {
        let swapedSeed = ConvertUtil.swapByteArray(privateKeySeed)
        return ConvertUtil.toHexString(swapedSeed)
    }
    
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
        return keyPair
    }
    
    static func repairKeyPair(_ importKey: String) -> KeyPair {
        var privateKeySeed: [UInt8] = []
        let importKeyByteArray = ConvertUtil.toByteArray(importKey)
        let nativeSeed = ConvertUtil.swapByteArray(importKeyByteArray)
        privateKeySeed = ConvertUtil.toArray(nativeSeed, PRIVATE_KEY_SEED_SIZE)
        
        let privateKey = UnsafeMutablePointer<UInt8>.allocate(capacity: PRIVATE_KEY_SIZE)
        let publicKey = UnsafeMutablePointer<UInt8>.allocate(capacity: PUBLIC_KEY_SIZE)
        
        ed25519_sha3_create_keypair(publicKey, privateKey, ConvertUtil.toNativeArray(privateKeySeed))
        
        let keyPair = KeyPair(publicKey: ConvertUtil.toArray(publicKey, PUBLIC_KEY_SIZE),
                              privateKey: ConvertUtil.toArray(privateKey, PRIVATE_KEY_SIZE),
                              privateKeySeed: privateKeySeed)
        return keyPair
    }
}
