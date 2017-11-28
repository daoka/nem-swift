//
//  TransferTransactionHelper.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/22.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import Foundation

struct TransferMosaic {
    let namespace: String
    let mosaic: String
    let quantity: Int
}

class TransferTransactionHelper: TransactionHelper {
    
    enum MessageType: UInt32 {
        case Plain = 1
        case Secure = 2
    }
    
    let recipientAddress: String
    let amount: UInt64
    let messageType: MessageType
    let message: String
    let mosaics: [TransferMosaic]?
    
    init(publicKey: [UInt8], network: Network, receipentAddress: String, amount: UInt64, messageType: MessageType, message: String, mosaics: [TransferMosaic]?) {
        self.recipientAddress = receipentAddress
        self.amount = amount
        self.messageType = messageType
        self.message = message
        self.mosaics = mosaics
        
        super.init(type: .Transfer, publicKey: publicKey, network: network)
    }
    
    public func generateRequestAnnounce() -> [UInt8] {
        let commonField = generateCommonTransactionField(transactionFee: transferFee())
        let messageBytes: [UInt8]
        
        if (message.isEmpty) {
            messageBytes = ConvertUtil.toByteArrayWithLittleEndian(UInt32(0))
        } else {
            messageBytes = ConvertUtil.toByteArrayWithLittleEndian(messageLength()) +
            ConvertUtil.toByteArrayWithLittleEndian(messageType.rawValue) +
            ConvertUtil.toByteArrayWithLittleEndian((UInt32)(messagePayloadBytes().count)) +
            messagePayloadBytes()
        }
        
        return commonField +
            ConvertUtil.toByteArrayWithLittleEndian(UInt32(recipientAddress.count)) +
            Array(recipientAddress.utf8) as [UInt8] +
            ConvertUtil.toByteArrayWithLittleEndian(amount) +
            messageBytes +
            ConvertUtil.toByteArrayWithLittleEndian(UInt32(0))
    }
    
    private func messagePayloadBytes() -> [UInt8] {
        // TODO: 暗号化は後で対応する
        return Array(message.utf8)
    }
    
    private func messageLength() -> UInt32 {
        return UInt32(4) + UInt32(4) + (UInt32)(messagePayloadBytes().count)
    }
    
    private func transferFee() -> UInt64 {
        return xemTransferFee() + messageTransferFee()
    }
    
    private func xemTransferFee() -> UInt64 {
        return UInt64(max(50_000, min(((amount / 10_000_000_000) * 50_000), (UInt64)(TransactionHelper.maximumXemTransferFee))))
    }
    
    private func messageTransferFee() -> UInt64 {
        let count = messagePayloadBytes().count
        return (UInt64)(count > 0 ? 50_000 * UInt(1 + message.lengthOfBytes(using: .utf8) / 32) : 0)
    }
}
