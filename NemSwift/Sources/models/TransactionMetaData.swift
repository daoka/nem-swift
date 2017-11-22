//
//  TransactionMetaData.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/21.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct TransactionMetaData: Decodable {
    let height: Int
    let id: Int
    let hash: TransactionHash
}

struct TransactionHash: Decodable {
    let data: String
}
