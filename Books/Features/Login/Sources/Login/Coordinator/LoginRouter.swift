//
//  LoginRouter.swift
//  
//
//  Created by Daniel Gomes on 05/02/22.
//

import Common
import UIKit
import Swinject

public protocol LoginDepartingRouter { }

public class LoginRouter: Router {

    // MARK: - Properties
    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    public var container: Container
    public var departingCoordinator: LoginDepartingRouter

    public init(container: Container, navigationController: UINavigationController, departingCoordinator: LoginDepartingRouter) {
        self.container = container
        self.navigationController = navigationController
        self.departingCoordinator = departingCoordinator
    }

    // MARK: - Methods
    public func start() {
        navigate(to: viewController(.login), asTopViewController: true, modifying: nil, completion: nil)
    }

    public enum Route: Destination, CaseIterable {

        case login
    }

    private func viewController(_ route: Route) -> UIViewController {
        switch route {
        case .login:
            return container.resolveSafe(LoginViewController.self)
        }
    }
}

// MARK: - LoginRoutingLogic
extension LoginRouter: LoginRoutingLogic {

    public func showHome() {
        // TODO: navigation
    }
}
