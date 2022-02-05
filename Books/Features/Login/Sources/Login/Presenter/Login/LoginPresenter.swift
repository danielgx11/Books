//
//  LoginPresenter.swift
//  
//
//  Created by Daniel Gomes on 05/02/22.
//

public protocol LoginPresentationLogic: AnyObject {

    func showHome()
}

public class LoginPresenter {

    // MARK: - Properties
    internal weak var view: LoginDisplayLogic?

    public init() { }

    public func attach(view: LoginDisplayLogic) {
        self.view = view
    }
}

// MARK: - LoginPresentationLogic
extension LoginPresenter: LoginPresentationLogic {

    public func showHome() {
        view?.showHome()
    }
}
