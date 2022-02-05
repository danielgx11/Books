//
//  Router.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Foundation
import UIKit
import Swinject

public protocol Router: Coordinator {

    associatedtype Route: Destination
}

extension Router {

    public func navigate(to viewController: UIViewController,
                         asTopViewController: Bool, animated: Bool,
                         modifying: ((UIViewController) -> Void)?,
                         completion: ((UIViewController) -> Void)?) {
        modifying?(viewController)
        if asTopViewController {
            self.navigationController.setViewControllers([viewController], animated: animated) {
                completion?(viewController)
            }
        } else {
            self.navigationController.pushViewController(viewController, animated: animated) {
                completion?(viewController)
            }
        }
    }

    public func navigate(to viewController: UIViewController, asTopViewController: Bool,
                         modifying: ((UIViewController) -> Void)?,
                         completion: ((UIViewController) -> Void)?) {
        navigate(to: viewController, asTopViewController: asTopViewController,
                 animated: shouldNavigateWithAnimation(), modifying: modifying, completion: completion)
    }

    public func present(viewController: UIViewController, animated: Bool = true,
                        onNavigationController navController: UINavigationController? = nil,
                        modifying: ((UIViewController) -> Void)?) {
        modifying?(viewController)

        if let navController = navController {
            self.navigationController.present(navController, animated: animated, completion: nil)
        } else {
            self.navigationController.present(viewController, animated: animated, completion: nil)
        }
    }

    public func present(viewController: UIViewController,
                        onNavigationController navController: UINavigationController? = nil,
                        modifying: ((UIViewController) -> Void)?) {
        present(viewController: viewController, animated: shouldNavigateWithAnimation(),
                onNavigationController: navController, modifying: modifying)
    }
}

public protocol Destination {

    var viewControllerType: UIViewController.Type { get }
}

public extension Destination {

    var viewControllerType: UIViewController.Type {
        UIViewController.self
    }
}
