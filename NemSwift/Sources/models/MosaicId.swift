//
//  MosaicId.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/21.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct MosaicId: Decodable {
    let namespaceId: String
    let name: String
}
