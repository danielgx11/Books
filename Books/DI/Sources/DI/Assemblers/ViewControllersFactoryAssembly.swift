//
//  ViewControllersFactoryAssembly.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Swinject
import AppNavigation

class ViewControllersFactoryAssembly: Assembly {

    func assemble(container: Container) {
        container.register(LoginViewControllerFactory.self) { ViewControllersFactory(resolver: $0) }
    }
}
