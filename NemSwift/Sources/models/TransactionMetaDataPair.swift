//
//  TransactionMetaDataPair.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/22.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct TransactionMetaDataPairs: Decodable {
    let data: [TransactionMetaDataPair]
}

struct TransactionMetaDataPair: Decodable {
    let meta: TransactionMetaData
    let transaction: Transaction
}
