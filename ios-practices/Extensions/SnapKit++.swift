//
//  SnapKit++.swift
//  ios-practices
//
//  Created by Well on 2022/3/11.
//

import SnapKit

extension UIView {
    var safeArea: ConstraintLayoutGuideDSL {
        safeAreaLayoutGuide.snp
    }
}
