//
// UIViewController++.swift
//
// Created by Ben for PracticeUI on 2021/3/26.
// Copyright © 2021 Alien. All rights reserved.
//

import ObjectiveC.runtime
import UIKit
private var kWKTabBarController = "key.wk.tabbar"
extension UIViewController {
    var wk_TabBarController: WKTabBarController? {
        set {
            objc_setAssociatedObject(self, &kWKTabBarController, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            let tabBar = objc_getAssociatedObject(self, &kWKTabBarController)
            if tabBar == nil, parent != nil {
                return parent?.wk_TabBarController
            }
            return tabBar as? WKTabBarController
        }
    }

    var wk_TabBarItem: WKTabBarItem? {
        tabBarItem as? WKTabBarItem
    }
}
