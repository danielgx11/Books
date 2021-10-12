//
//  UINavigationController+Extensions.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import UIKit

public extension UINavigationController {

    func popToRootWithHandler(completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popToRootViewController(animated: true)
        CATransaction.commit()
    }

    func popViewControllerWithHandler(animated: Bool = true, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: animated)
        CATransaction.commit()
    }

    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.setViewControllers(viewControllers, animated: animated)
        CATransaction.commit()
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }

    func popTo(viewControllerType: UIViewController.Type) -> Bool {
        guard let controller = viewControllers.filter({ $0.isKind(of: viewControllerType) }).first else { return false }

        popToViewController(controller, animated: true)
        return true
    }

    func popTo<T: UIViewController>(viewControllerType: T.Type, modifying: ((T) -> Void)?) -> Bool {
        guard let controller = viewControllers.filter({ $0.isKind(of: viewControllerType) }).first as? T else { return false }

        modifying?(controller)
        popToViewController(controller, animated: true)

        return true
    }

    func removeFirstViewControllerOfKind(viewControllerType: UIViewController.Type) {
        guard let index = viewControllers.enumerated()
            .filter({ $0.element.isKind(of: viewControllerType) }).first?.offset else {
            return
        }

        viewControllers.remove(at: index)
    }

    func removeViewControllers(of kind: UIViewController.Type) {
        viewControllers.removeAll { viewController -> Bool in
            return viewController.isKind(of: kind)
        }
    }

    var previousViewController: UIViewController? {
        guard viewControllers.count >= 2 else { return nil }

        return viewControllers[viewControllers.count - 2]
    }
}
