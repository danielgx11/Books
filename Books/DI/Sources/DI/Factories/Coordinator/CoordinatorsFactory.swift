//
//  CoordinatorsFactory.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Swinject
import Common
import AppNavigation
import Login

public class CoordinatorsFactory: DependencyFactory {

    let resolver: Resolver

    required public init(resolver: Resolver) {
        self.resolver = resolver
    }
}

// MARK: - AppCoordinatorsFactoryProtocol
extension CoordinatorsFactory: CoordinatorFactory {

    public func makeLoginCoordinator() -> LoginCoordinator {
        resolver.resolveSafe(LoginCoordinator.self)
    }
}

// MARK: - LoginCoordinatorsFactoryProtocol
extension CoordinatorsFactory: LoginCoordinatorFactory { }
