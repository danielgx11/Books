//
//  Coordinator.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Foundation
import Swinject
import UIKit

public protocol CoordinatorDelegate: AnyObject {

    func coordinatorDidExit(_ coordinator: Coordinator)
}

public protocol Coordinator: CoordinatorDelegate {

    var coordinatorDelegate: CoordinatorDelegate? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var container: Container { get }

    func start()
    func shouldNavigateWithAnimation() -> Bool
}

extension Coordinator {

    public func coordinatorDidExit(_ coordinator: Coordinator) {
        guard let index = self.childCoordinators.firstIndex(where: { $0 === coordinator }) else { return }

        self.childCoordinators.remove(at: index)
    }

    public func shouldNavigateWithAnimation() -> Bool {
        true
    }
}
