//
//  LoginInteractor.swift
//  
//
//  Created by Daniel Gomes on 05/02/22.
//

import Domain

public protocol LoginBusinessLogic: AnyObject {

    func signIn(withCredentials credentials: Credentials)
}

public class LoginInteractor {

    // MARK: - Properties
    internal weak var presenter: LoginPresentationLogic?

    public required init(presenter: LoginPresentationLogic) {
        self.presenter = presenter
    }
}

// MARK: - LoginBusinessLogic
extension LoginInteractor: LoginBusinessLogic {

    public func signIn(withCredentials credentials: Credentials) {
        // TODO: sign in request
        presenter?.showHome()
    }
}
