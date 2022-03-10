//
//  WKTabCellViewModel.swift
//  ios-practices
//
//  Created by Well on 2022/3/11.
//

import UIKit

class WKTabCellViewModel: TableCellViewModel {
    init() {
        super.init(text: "WKTabController")
    }
    override func pressCell() {
        
        let tab = WKTabBarController()

        let vc1 = WKBaseViewController()
        let vc2 = WKBaseViewController()
        let vc3 = WKBaseViewController()

        let vcItem1 = WKTabBarItem()
        let vcItem2 = WKTabBarItem()
        let vcItem3 = WKTabBarItem()

        vcItem1.title = "Page1"
        vcItem2.title = "Page2"
        vcItem3.title = "Page3"

        vcItem1.image = UIImage(named: "home")
        vcItem1.selectedImage = UIImage(named: "home_1")
        vcItem2.image = UIImage(named: "find")
        vcItem2.selectedImage = UIImage(named: "find_1")
        vcItem3.image = UIImage(named: "favor")
        vcItem3.selectedImage = UIImage(named: "favor_1")

        vc1.tabBarItem = vcItem1
        vc2.tabBarItem = vcItem2
        vc3.tabBarItem = vcItem3

        tab.setViewControllers(vcs: [vc1, vc2, vc3])
        
        
        output.pushVC.accept(tab)
    }
}
