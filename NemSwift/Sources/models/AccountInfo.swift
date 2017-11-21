//
//  AccountInfo.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/20.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct AccountInfo: Decodable {
    let address: String
    let balance: Int
    let vestedBalance: Int
    let importance: Double
    let publicKey: String?
    let label: String?
    let harvestedBlocks: Int
}
