//
//  ViewController.swift
//  NemSwift
//
//  Created by Kazuya Okada on 2017/11/15.
//  Copyright © 2017年 OpenApostille. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let account = Account.generteAccount(network: .mainnet)
        print("address: \(account.address.value)")
        print("publicKey: \(account.keyPair.publicKeyHexString())")
        print("privateKey: \(account.keyPair.privateKeyHexString())")
        print("importKey: \(account.keyPair.importKey())")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

