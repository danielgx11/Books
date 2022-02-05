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
        label.numberOfLines = 0
        label.textColor = .white
        label.font = FontFamily.RubikMedium.regular.font(size: ScreenSize.returnOnSmall(24, or: 26))
        label.text = L10n.Login.Header.Label.title
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
        label.font = FontFamily.RubikMedium.regular.font(size: ScreenSize.returnOnSmall(16, or: 18))
        label.text = L10n.Login.Footer.Label.title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.Login.Placeholder.email
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = L10n.Login.Placeholder.password
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()


    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = ColorName.manatee
        button.titleLabel?.textColor = ColorName.white
        button.setTitle(L10n.Login.Button.signIn, for: .normal)
        button.layer.cornerRadius = ScreenSize.returnOnSmall(20, or: 24)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
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
        setupFooterTitleConstraints()
        setupSignInButtonConstraints()
        setupTextFieldsStackViewContraints()
    }

    private func setupHierarchy() {
        addSubview(headerView)
        addSubview(footerView)

        headerView.addSubview(headerTitle)

        footerView.addSubview(footerTitle)
        footerView.addSubview(textFieldsStackView)
        footerView.addSubview(signInButton)

        textFieldsStackView.addArrangedSubview(emailTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)
    }

    private func setupHeaderViewConstraints() {
        NSLayoutConstraint.activate(
            [
                headerView.topAnchor.constraint(equalTo: topAnchor),
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
                headerTitle.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                headerTitle.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 296/360),
                headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -24)
            ]
        )
    }

    private func setupFooterTitleConstraints() {
        NSLayoutConstraint.activate(
            [
                footerTitle.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                footerTitle.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 296/360),
                footerTitle.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 16),
                footerTitle.heightAnchor.constraint(equalToConstant: 24)
            ]
        )
    }

    private func setupSignInButtonConstraints() {
        NSLayoutConstraint.activate(
            [
                signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
                signInButton.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 296/360),
                signInButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -24),
                signInButton.heightAnchor.constraint(equalToConstant: ScreenSize.returnOnSmall(48, or: 64)),
            ]
        )
    }

    private func setupTextFieldsStackViewContraints() {
        NSLayoutConstraint.activate(
            [
                textFieldsStackView.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
                textFieldsStackView.widthAnchor.constraint(equalTo: footerView.widthAnchor, multiplier: 296/360),
                textFieldsStackView.topAnchor.constraint(equalTo: footerTitle.bottomAnchor, constant: 16),
                textFieldsStackView.heightAnchor.constraint(equalToConstant: 104)
            ]
        )
    }
}
