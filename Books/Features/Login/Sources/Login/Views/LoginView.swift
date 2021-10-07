//
//  LoginView.swift
//  
//
//  Created by Daniel Gomes on 05/10/21.
//

import Foundation
import UIKit
import Common
import Domain

public class LoginView: UIView {

    // MARK: - Properties
    public var didTapLogin: ((Credentials) -> Void)?

    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorName.marineBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var footerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var footerTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()


    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var footerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Life Cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupUI()
    }

     // MARK: - Actions
    @objc func nextScene() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }

        let credentials = Credentials(email: email, password: password)
        didTapLogin?(credentials)
    }
}

// MARK: - UI
extension LoginView {

    private func setupUI() {
        backgroundColor = ColorName.white

        setupHierarchy()
        setupHeaderViewConstraints()
        setupFooterViewConstraints()
        setupHeaderTitleConstraints()
        setupFooterStackViewContraints()
    }

    private func setupHierarchy() {
        addSubview(headerView)
        addSubview(footerView)

        headerView.addSubview(headerTitle)

        footerView.addSubview(footerStackView)

        footerStackView.addArrangedSubview(footerTitle)
        footerStackView.addArrangedSubview(emailTextField)
        footerStackView.addArrangedSubview(passwordTextField)
        footerStackView.addArrangedSubview(signInButton)
    }

    private func setupHeaderViewConstraints() {
        NSLayoutConstraint.activate(
            [
                headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                headerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                headerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                headerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2)
            ]
        )
    }

    private func setupFooterViewConstraints() {
        NSLayoutConstraint.activate(
            [
                footerView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
                footerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                footerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                footerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }

    private func setupHeaderTitleConstraints() {
        NSLayoutConstraint.activate(
            [
                headerTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
                headerTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 296/360),
                headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -24)
            ]
        )
    }

    private func setupFooterStackViewContraints() {
        NSLayoutConstraint.activate(
            [
                footerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                footerStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 296/360),
                footerView.topAnchor.constraint(equalTo: footerView.bottomAnchor, constant: 24),
                footerView.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -32)
            ]
        )
    }
}
