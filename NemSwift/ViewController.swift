//
//  ViewController.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/15.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let account = Account.generteAccount(network: .mainnet)
        print("address: \(account.address.value)")
        print("publicKey: \(account.keyPair.publicKeyHexString())")
        print("privateKey: \(account.keyPair.privateKeyHexString())")
        print("importKey: \(account.keyPair.importKey())")
        print("=======================")
        
        let repairAccount = Account.repairAccount(account.keyPair.importKey(), network: .mainnet)
        print("publicKey by import key : \(repairAccount.keyPair.publicKeyHexString())")
        /*
        Session.send(NISAPI.AccountGetFromPublicKey(publicKey: account.keyPair.publicKeyHexString())) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        */
        Session.send(NISAPI.AccountGet(address: account.address.value)) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

