//
//  LoginViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/25/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class LoginViewController: LoginLayoutViewController {
    private let dataManager = AccountDataManager()

    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
    }

    @objc private func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {
                return
        }

        dataManager.login(email: email, password: password) { (token, error) in

        }
    }
}
