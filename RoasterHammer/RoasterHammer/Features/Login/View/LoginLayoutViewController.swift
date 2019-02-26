//
//  LoginLayoutViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class LoginLayoutViewController: UIViewController {
    var emailTextField = UITextField(forAutoLayout: ())
    var passwordTextField = UITextField(forAutoLayout: ())
    var loginButton = UIButton(forAutoLayout: ())

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
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
