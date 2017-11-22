//
//  Importance.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/22.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct Importances: Decodable {
    let data: [Importance]
}

struct Importance: Decodable {
    let address: String
    let isSet: Int
    let score: Double?
    let ev: Double?
    let height: UInt?
}
