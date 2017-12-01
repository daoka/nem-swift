//
//  MosaicLevy.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/12/01.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct MosaicLevy: Decodable {
    let type: UInt
    let recipient: String
    let mosaicId: MosaicId
    let fee: UInt
}
