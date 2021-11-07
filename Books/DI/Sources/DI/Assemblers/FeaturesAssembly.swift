//
//  FeaturesAssembly.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Swinject
import AppNavigation
import Login

class FeaturesAssembly: Assembly {

    func assemble(container: Container) {
        assembleLogin(container: container)
    }
}

// MARK: - ViewModels
extension FeaturesAssembly {

    private func assembleLogin(container: Container) {
        let coordinator = container.resolveSafe(LoginCoordinator.self)
        container.register(LoginSceneCoordinating.self) { _ in coordinator }
        container.autoregister(LoginViewModeling.self, initializer: LoginViewModel.init)

        container.register(LoginViewController.self) {
            let controller = LoginViewController()
            controller.loginViewModel = $0.resolveSafe(LoginViewModeling.self)

            return controller
        }
    }
}
