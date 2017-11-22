//
//  UnconfirmedTransactionMetaDataPair.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/22.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct UnconfirmedTransactionMetaDataPairs: Decodable {
    let data: [UnconfirmedTransactionMetaDataPair]
}

struct UnconfirmedTransactionMetaDataPair: Decodable {
    let meta: UnconfirmedTransactionMetaData
    let transaction: Transaction
}
