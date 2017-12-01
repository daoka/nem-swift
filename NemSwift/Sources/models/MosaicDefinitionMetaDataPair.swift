//
//  MosaicDefinitionMetaDataPair.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/12/01.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct MosaicDefinitionMetaDataPairs: Decodable {
    let data: [MosaicDefinitionMetaDataPair]
}

struct MosaicDefinitionMetaDataPair: Decodable {
    let meta: MosaicMetaData
    let mosaic: MosaicDefinition
}
