//
//  ViewControllersFactory.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Swinject
import Domain
import Common
import AppNavigation
import Login
import UIKit

class ViewControllersFactory: DependencyFactory {

    let resolver: Resolver

    required init(resolver: Resolver) {
        self.resolver = resolver
    }
}

// MARK: - LoginViewControllerFactory
extension ViewControllersFactory: LoginViewControllerFactory {

    func registerLoginViewController() {
        let controller = LoginViewController()
        let viewModel = resolver.resolveSafe(LoginViewModel.self)
        controller.loginViewModel = viewModel
    }
}
