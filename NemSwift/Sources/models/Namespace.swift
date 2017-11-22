//
//  Namespace.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/22.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct Namespaces: Decodable {
    let data: [Namespace]
}

struct Namespace: Decodable {
    let fqn: String
    let owner: String
    let height: UInt
}
