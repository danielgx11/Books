//
//  LoginCoordinator.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Common
import UIKit
import Swinject

public protocol LoginDepartingCoordinator: AnyObject { }

public class LoginCoordinator: Router {

    // MARK: - Properties
    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    public var container: Container
    public var departingCoordinator: LoginDepartingCoordinator

    public init(container: Container, navigationController: UINavigationController, departingCoordinator: LoginDepartingCoordinator) {
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

// MARK: - LoginSceneCoordinating
extension LoginCoordinator: LoginSceneCoordinating {

    public func showHome() {
        // TODO: navigation
    }
}
