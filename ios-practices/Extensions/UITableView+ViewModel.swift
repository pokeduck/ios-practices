//
//  UITableView+ViewModel.swift
//  ios-practices
//
//  Created by Well on 2022/3/11.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell, U: CellViewModelProtocol>(cellWithClass name: T.Type, reuseIdentifierForClass id: U.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: id))
    }

    func dequeueReuseableCell(withViewModel viewModel: CellViewModelProtocol, index: IndexPath) -> UITableViewCell {
        dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier(), for: index)
    }
}
