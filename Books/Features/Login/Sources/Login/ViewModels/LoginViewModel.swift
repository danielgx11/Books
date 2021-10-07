//
//  LoginViewModel.swift
//  
//
//  Created by Daniel Gomes on 07/10/21.
//

import Foundation
import UIKit
import Domain

public protocol LoginViewable: AnyObject {

    func show(error: String)
}

public protocol LoginSceneCoordinating {

    func showHome()
}

public class LoginViewModel {

    // MARK: - Properties
    internal weak var view: LoginViewable?
    internal let coordinator: LoginSceneCoordinating

    public required init(coordinator: LoginSceneCoordinating) {
        self.coordinator = coordinator
    }

    public func attach(view: LoginViewable) {
        self.view = view
    }
}

// MARK: - LoginViewModeling
extension LoginViewModel: LoginViewModeling {

    public func signIn(withCredentials credentials: Credentials) {
        // TODO: make request
        coordinator.showHome()
    }
}
