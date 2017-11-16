//
//  Account.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/16.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct Account {
    let keyPair: KeyPair
    let address: Address
    
    static public func generteAccount(network: Address.Network) -> Account {
        let keyPair = KeyPair.generateKeyPair()
        let address = Address(publicKey: keyPair.publicKey, network: network)
        return Account(keyPair: keyPair, address: address)
    }
}
