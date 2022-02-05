//
//  CoordinatorAssembly.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import UIKit
import Common
import Swinject
import BooksUI
import AppNavigation
import Login

class CoordinatorAssembly: Assembly {

    // MARK: - Properties
    let window: UIWindow?
    let navigationController: UINavigationController?
    weak var appCoordinator: AppCoordinator?

    // MARK: - Inits
    init(window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }

    // MARK: - Methods
    func assemble(container: Container) {
        assembleAppCoordinator(container: container)
        assembleLoginCoordinator(container: container)
    }
}

// MARK: - Coordinators
extension CoordinatorAssembly {

    func assembleAppCoordinator(container: Container) {
        container.register(AppCoordinator.self) { _ in
            AppCoordinator(container: container, window: self.window ?? UIWindow(), navigationController: self.navigationController)
        }
        self.appCoordinator = container.resolveSafe(AppCoordinator.self)
    }

    func assembleLoginCoordinator(container: Container) {
        let appCoordinator = container.resolveSafe(AppCoordinator.self)
        container.register(LoginRouter.self) { _ in
            LoginRouter(container: container,
                        navigationController: appCoordinator.navigationController,
                        departingCoordinator: appCoordinator)
        }
    }
}
