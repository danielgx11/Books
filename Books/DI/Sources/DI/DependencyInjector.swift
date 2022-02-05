//
//  DependencyInjector.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import UIKit
import Swinject
import AppNavigation
import Domain

public class DependencyInjector {

    // MARK: - Properties
    let window: UIWindow?
    let navigationController: UINavigationController?

    // MARK: - Inits
    public init(window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }

    // MARK: - Methods
    public func build(completion: (_ assembler: Assembler, _ appCoordinator: AppCoordinator) -> ()) {
        let assembler = Assembler([
            CoordinatorFactoryAssembly(),
            ViewControllersFactoryAssembly(),
            CoordinatorAssembly(window: window, navigationController: navigationController),

            DomainAssembly(),
            DataAssembly(),
            NetworkingAssembly(),
            StorageAssembly(),

            FeaturesAssembly()
        ])

        let appCoordinator = assembler.resolver.resolveSafe(AppCoordinator.self)
        completion(assembler, appCoordinator)
    }
}
