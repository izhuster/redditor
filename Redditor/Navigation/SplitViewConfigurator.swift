//
//  SplitViewConfigurator.swift
//  Redditor
//
//  Created by Alejandro Cárdenas on 16/11/19.
//  Copyright © 2019 Alejandro Cárdenas. All rights reserved.
//

import UIKit

enum SplitViewConfigurator {
    static func configure(splitViewController: UISplitViewController) {
        splitViewController.preferredDisplayMode = .allVisible
    }
    
    /// If `window?.rootViewController` is a `UISplitViewController`, default configuration will be used defined in
    /// `SplitViewConfigurator.configure(splitViewController:)`
    static func configureIfAvailable(window: UIWindow?) {
        guard let splitViewController = window?.rootViewController as? UISplitViewController else {
            print("\(#function) needs a UISplitViewController but a \(String(describing: window?.rootViewController.self)) was provided instead.")
            return
        }

        configure(splitViewController: splitViewController)
    }
}
