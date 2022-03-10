//
//  UIViewController+Rx.swift
//  ios-practices
//
//  Created by Well on 2022/3/11.
//

import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UIViewController {

    var pushViewController: Binder<UIViewController> {
        Binder(base) { vc, willPushVC in
            vc.navigationController?.pushViewController(willPushVC, animated: true)
        }
    }

    var dismiss: Binder<Bool> {
        Binder(base) { vc, animated in
            vc.dismiss(animated: animated, completion: nil)
        }
    }

    var popViewController: Binder<Void> {
        Binder(base) { vc, _ in
            vc.navigationController?.popViewController(animated: true)
        }
    }

    var presentViewController: Binder<UIViewController> {
        Binder(base) { vc, willPresentVC in
            vc.present(willPresentVC, animated: true, completion: nil)
        }
    }
}
