//
//  CoordinatorFactoryAssembly.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Swinject
import SwinjectAutoregistration
import AppNavigation

class CoordinatorFactoryAssembly: Assembly {

    func assemble(container: Container) {
        container.register(CoordinatorFactory.self) { CoordinatorsFactory(resolver: $0) }
//        container.register(LoginCoordinatorFactory.self) { LoginCoordinatorFactory(resolver: $0) }
    }
}
