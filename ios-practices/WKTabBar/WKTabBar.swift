//
// WKTabBar.swift
//
// Created by Ben for PracticeUI on 2021/3/24.
// Copyright © 2021 Alien. All rights reserved.
//

import UIKit

protocol WKTabBarDelegate: AnyObject {
    func tabBar(_ tabBar: WKTabBar, shouldSelected item: WKTabBarItem) -> Bool
    func tabBar(_ tabBar: WKTabBar, willSelected item: WKTabBarItem)
    func tabBar(_ tabBar: WKTabBar, didSelected item: WKTabBarItem)
}

extension WKTabBarDelegate {
    func tabBar(_ tabBar: WKTabBar, shouldSelected item: WKTabBarItem) -> Bool {
        true
    }
}

class WKTabBar: UIView {
    weak var tabBarController: WKTabBarController?

    weak var delegate: WKTabBarDelegate?

    weak var selectedItem: WKTabBarItem? {
        didSet {
            selectedItem?.contentView.seletct()
        }
    }

    private(set) var containers: [WKTabBarItemContainer] = []

    var items: [WKTabBarItem]? {
        didSet {
            reload()
        }
    }

    func removeAll() {
        for container in containers {
            container.removeFromSuperview()
        }
        containers.removeAll()
    }

    func reload() {
        removeAll()
        guard let tabBarItems = items else {
            // assertionFailure("Empty Items")
            return
        }
        for (idx, item) in tabBarItems.enumerated() {
            let container = WKTabBarItemContainer(self, tag: idx)
            // container.addTarget(self, action: #selector(selectAction(_:)), for: .touchUpInside)
            addSubview(container)
            containers.append(container)
            container.addSubview(item.contentView)
        }

        // self.updateAccessibilityLabels()
        setNeedsLayout()
    }

    override func layoutSubviews() {
        
        let count = items?.count ?? 0
        let w = CGFloat(roundf(Float(bounds.width) / Float(count)))

        let h = UIDevice.current.hasNotch ? bounds.height - 30 : bounds.height
        for (idx, container) in containers.enumerated() {
            let containerFrame = CGRect(x: w * CGFloat(idx), y: 0, width: w, height: h)
            container.frame = containerFrame
        }
    }

    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 20
        clipsToBounds = true
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    // MARK: Action

    @objc func selectAction(_ sender: AnyObject?) {
        guard let container = sender as? WKTabBarItemContainer else {
            return
        }
        let tag = container.tag
        select(index: tag)
        
    }

    @objc func highlightAction(_ sender: AnyObject?) {
        
    }

    @objc func dehighlightAction(_ sender: AnyObject?) {
        
    }

    // MARK: Selection

    private func select(index: Int) {
        guard let item = items?[index] else { return }

        guard let canSelect = delegate?.tabBar(self, shouldSelected: item) else { return }

        if canSelect == false { return }

        delegate?.tabBar(self, willSelected: item)

        let currentIndexTemp = (selectedItem?.tag ?? 0)
        let currentIndex = (currentIndexTemp < 0) ? 0 : currentIndexTemp

        let newIndex = max(0, index)

        if currentIndex == newIndex {
            // 點同一頁
            if let tabBarController = tabBarController {
                let selectedVC = tabBarController.selectedViewController
                var navVC: UINavigationController?
                if let n = selectedVC as? UINavigationController {
                    navVC = n
                } else if let n = selectedVC.navigationController {
                    navVC = n
                }

                if let navVC = navVC {
                    if navVC.viewControllers.contains(tabBarController) {
                        if navVC.viewControllers.count > 1, navVC.viewControllers.last != tabBarController {
                            navVC.popToViewController(tabBarController, animated: true)
                        }
                    } else {
                        if navVC.viewControllers.count > 1 {
                            navVC.popToRootViewController(animated: true)
                        } else if let lastVC = navVC.topViewController {
                            for view in lastVC.view.subviews {
                                if let scrollView = view as? UIScrollView {
                                    scrollView.setContentOffset(CGPoint(x: 0, y: -scrollView.adjustedContentInset.top), animated: true)
                                    break
                                }
                            }
                        }
                    }
                }
            }

        } else {
            // 點不同頁
            let currentItem = items?[currentIndex]
            currentItem?.contentView.deselect()
            selectedItem = item
        }

        delegate?.tabBar(self, didSelected: item)
    }
}
