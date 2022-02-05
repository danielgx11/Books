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
        let router = container.resolveSafe(LoginRouter.self)
        container.autoregister(LoginPresentationLogic.self, initializer: LoginPresenter.init)
        container.register(LoginRoutingLogic.self) { _ in router }
        container.register(LoginBusinessLogic.self) {
            let presenter = $0.resolveSafe(LoginPresentationLogic.self)
            let interactor = LoginInteractor(presenter: presenter)

            return interactor
        }

        container.register(LoginViewController.self) {
            let controller = LoginViewController()
            controller.interactor = $0.resolveSafe(LoginBusinessLogic.self)
            controller.router = $0.resolveSafe(LoginRoutingLogic.self)

            return controller
        }
    }
}
