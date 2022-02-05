//
//  LoginViewController.swift
//  
//
//  Created by Daniel Gomes on 07/10/21.
//

import Foundation
import UIKit
import Domain

public protocol LoginDisplayLogic: AnyObject {

    func showHome()
}

public protocol LoginRoutingLogic {

    func showHome()
}

public class LoginViewController: UIViewController {

    // MARK: - Properties
    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()

    // MARK: Instances
    public weak var interactor: LoginBusinessLogic?
    public var router: LoginRoutingLogic?

    // MARK: - Life Cycle
    public override func loadView() {
        view = loginView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

// MARK: - Methods
extension LoginViewController {

    private func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: true)

        setupSignIn()
    }

    private func setupSignIn() {
        loginView.didTapLogin = { [weak self] in
            self?.interactor?.signIn(withCredentials: $0)
        }
    }
}


// MARK: - LoginDisplayLogic
extension LoginViewController: LoginDisplayLogic {

    public func showHome() {
        router?.showHome()
    }
}
