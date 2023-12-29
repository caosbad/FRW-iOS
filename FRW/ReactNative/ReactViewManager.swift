//
//  ReactViewManager.swift
//  FRW
//
//  Created by cat on 2023/12/29.
//

import Foundation
import UIKit
import React

enum ReactModule {
    case app(name: String)
    
    var name: String {
        switch self {
        case .app(let name):
            return name
        }
    }
}

extension String {
    static let frw = "frw-rn-native"
}

class ReactViewManager {
    static let shared = ReactViewManager()
    var bridge: RCTBridge!
}

extension ReactViewManager {
    class func viewConttroller(module: ReactModule) -> UIViewController {
        let rnView = RCTRootView(bridge: ReactViewManager.shared.bridge, 
                                 moduleName: module.name,
                                 initialProperties: ReactHandler.initialProperties())
        let vc = UIViewController()
        vc.view = rnView
        return vc
    }
}
