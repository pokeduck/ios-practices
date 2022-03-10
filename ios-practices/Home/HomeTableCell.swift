//
//  HomeTableCell.swift
//  ios-practices
//
//  Created by Well on 2022/3/11.
//

import UIKit
import RxCocoa
import RxSwift

class TableViewCell: UITableViewCell, CellProtocol {
    // typealias CellViewModel = TableCellViewModel

    func setup(with viewModel: CellViewModelProtocol) {
        guard let vm = viewModel as? TableCellViewModel else {
            return
        }
        vm.output.title.bind(to: titleLabel.rx.text).disposed(by: bag)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var bag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }

    private lazy var titleLabel = UILabel().then { l in
        l.font = UIFont(font: .pingFangTCMedium, size: 20)
        l.textAlignment = .left
    }

    private func initUI() {
        let wrapper = UIView()
        wrapper.layer.borderWidth = 1
        wrapper.layer.cornerRadius = 5
        wrapper.backgroundColor = .white
        wrapper.addSubview(titleLabel)
        contentView.addSubview(wrapper)
        wrapper.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(8)
            make.right.bottom.equalToSuperview().offset(-8)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(8)
            make.right.bottom.equalToSuperview().offset(-8)
        }

        selectionStyle = .none
    }
}

