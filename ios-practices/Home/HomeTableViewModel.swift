//
//  HomeTableViewModel.swift
//  ios-practices
//
//  Created by Well on 2022/3/11.
//

import Foundation
import RxRelay

class TableCellViewModel: CellViewModelProtocol {
    struct Output {
        let pushVC = PublishRelay<UIViewController>.init()
        let title = BehaviorRelay<String>.init(value: "")
    }

    init(text: String) {
        output.title.accept(text)
    }

    let output = Output()

    func pressCell() {}
}
