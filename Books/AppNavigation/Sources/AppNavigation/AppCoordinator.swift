//
//  AppCoordinator.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Foundation
import UIKit
import Swinject
import SwinjectAutoregistration
import Common
import Domain
import Login

public class AppCoordinator: Coordinator {

    // MARK: - Properties
    weak public var coordinatorDelegate: CoordinatorDelegate?

    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    public var container: Container
    public let window: UIWindow

    // MARK: - Initializers
    public init(container: Container, window: UIWindow, navigationController: UINavigationController?) {
        self.container = container
        self.window = window
        self.navigationController = navigationController ?? UINavigationController()
    }

    // MARK: - Methods
    public func start() {
        // TODO: make custom nav bar and set up here
        self.navigationController.asBooksNavigationController()
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        Common.FontFamily.registerAllCustomFonts()
        showWelcome()
    }

    private func showWelcome() {
        let coordinator = container ~> (LoginCoordinator.self)
        coordinator.start()
    }
}

// MARK: - LoginDepartingCoordinator
extension AppCoordinator: LoginDepartingCoordinator { }
