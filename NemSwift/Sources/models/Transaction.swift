//
//  Transaction.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/21.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct Transaction: Decodable {
    let timeStamp: UInt
    let amount: UInt?
    let signature: String
    let fee: UInt
    let recipient: String?
    let type: UInt
    let version: Int
    let signer: String
    let mosaics: [Mosaic]?
    let message: TransactionMessage?
}
