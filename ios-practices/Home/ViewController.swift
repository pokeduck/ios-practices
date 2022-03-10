//
//  ViewController.swift
//  ios-practices
//
//  Created by Well on 2022/3/11.
//
import NSObject_Rx
import RxCocoa
import RxSwift
import SnapKit
import Then
import UIFontComplete
import UIKit









class ViewController: UIViewController {
    private lazy var tableView = UITableView().then { [unowned self] tv in
        tv.delegate = self
        // tv.register(cellWithClass: TableViewCell.self, reuseIdentifierForClass: TableCellViewModel.self)
        tv.register(cellWithClass: TableViewCell.self)
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.contentInset.top = 20
    }

    private var cellViewModels = [TableCellViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalTo(view.safeAreaLayoutGuide)
        }

        cellViewModels.append(contentsOf: [WKTabCellViewModel(),CustomTabCellViewModel()])
        cellViewModels.forEach { [unowned self] vm in
            vm.output.pushVC.bind(to: rx.pushViewController).disposed(by: self.rx.disposeBag)
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellViewModels[indexPath.row].pressCell()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = cellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withClass: TableViewCell.self, for: indexPath)
        cell.setup(with: vm)
        return cell
    }
}
