//
//  AccountMetaData.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/21.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct AccountMetaData: Decodable {
    let status: String
    let remoteStatus: String
    let cosignatoryOf: [AccountInfo]
    let cosignatories: [AccountInfo]
}
