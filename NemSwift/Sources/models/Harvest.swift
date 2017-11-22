//
//  AccountHarvests.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/22.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct Harvests: Decodable {
    let data: [Harvest]
}

struct Harvest: Decodable {
    let timeStamp: UInt
    let blockHash: AccountHarvestBlockHash
    let totalFee: UInt
    let height: UInt
}

struct AccountHarvestBlockHash: Decodable{
    let data: String
}
