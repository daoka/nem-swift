//
//  NISError.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/28.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct NISErrorResponse: Decodable {
    let timeStamp: UInt
    let error: String
    let message: String
    let status: UInt
}
