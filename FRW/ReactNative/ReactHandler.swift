//
//  ReactHandler.swift
//  FRW
//
//  Created by cat on 2023/12/28.
//

import Foundation

@objc(ReactHandler)
class ReactHandler: NSObject {
    
    // propertiess to react native when init
    @objc
    static func initialProperties() -> [String: Any] {
        let address = WalletManager.shared.selectedAccountAddress
        let network = LocalUserDefaults.shared.flowNetwork.rawValue
        let isLogin = UserManager.shared.isLoggedIn
        return [
            "address": address,
            "network": network,
            "isLogin": isLogin
        ]
    }
    
    @objc
    func getAddress(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async {
            let address = WalletManager.shared.selectedAccountAddress
            resolve(address)
        }
    }
}

