//
//  LoginViewController.swift
//  
//
//  Created by Daniel Gomes on 07/10/21.
//

import Foundation
import UIKit
import Domain

public protocol LoginViewModeling {

    func signIn(withCredentials credentials: Credentials)
}

public class LoginViewController: UIViewController {

    // MARK: - Properties
    private lazy var loginView: LoginView = {
        let view = LoginView()
        return view
    }()

    // MARK: Instances
    public var loginViewModel: LoginViewModeling?

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
            self?.loginViewModel?.signIn(withCredentials: $0)
        }
    }
}
