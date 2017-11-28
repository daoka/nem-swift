//
//  NemAnnounceResult.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/28.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct NemAnnounceResult: Decodable {
    let type: UInt
    let code: UInt
    let message: String
    let transactionHash: TransactionHash
    let innerTransactionHash: TransactionHash?
}


