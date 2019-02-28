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
    var interactor: LoginViewOutput!

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

        interactor.login(email: email, password: password)
    }
}

extension LoginViewController: LoginView {
    func didLogin() {
        // TODO
        let alert = UIAlertController(title: "Login", message: "You successfully logged in", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
    }

    func didReceiveError(_ error: Error) {
        // TODO
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(dismissAction)
        present(alert, animated: true, completion: nil)
    }

}
