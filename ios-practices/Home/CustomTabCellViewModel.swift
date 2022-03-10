//
//  CustomTabCellViewModel.swift
//  ios-practices
//
//  Created by Well on 2022/3/11.
//

import UIKit

class CustomTabCellViewModel: TableCellViewModel {
    init() {
        super.init(text: "CustomTabBar")
    }
    override func pressCell() {
        output.pushVC.accept(ViewController())
    }
}
