//
//  LoginLayoutViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class LoginLayoutViewController: BaseViewController {
    var emailTextField = UITextField(forAutoLayout: ())
    var passwordTextField = UITextField(forAutoLayout: ())
    var loginButton = UIButton(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.black, for: .normal)

        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)

        let margins = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: margins.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leftAnchor.constraint(equalTo: margins.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: margins.rightAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            loginButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
            ])
    }
}
