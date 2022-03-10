//
//  cell.swift
//  ios-practices
//
//  Created by Well on 2022/3/11.
//

import Foundation

protocol CellProtocol: AnyObject {
    // associatedtype CellViewModel: CellViewModelProtocol
    func setup(with viewModel: CellViewModelProtocol)
}

protocol CellViewModelProtocol: AnyObject {
    func reuseIdentifier() -> String
    func pressCell()
}

extension CellViewModelProtocol {
    func reuseIdentifier() -> String {
        String(describing: type(of: self))
    }

    func pressCell() {}
}
