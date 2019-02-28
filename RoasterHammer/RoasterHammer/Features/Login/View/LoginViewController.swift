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
    private lazy var router: LoginRouter = {
        return LoginRouter(navigationController: navigationController)
    }()

    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.addTarget(self, action: #selector(loginButtonTapped(_:)), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped(_:)), for: .touchUpInside)

        let closeButton = UIBarButtonItem(title: "Close",
                                          style: .plain,
                                          target: self,
                                          action: #selector(closeButtonTapped(_:)))
        navigationItem.rightBarButtonItem = closeButton
    }

    @objc private func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {
                return
        }

        interactor.login(email: email, password: password)
    }

    @objc private func createAccountButtonTapped(_ sender: UIButton) {
        router.presentCreateAccountView()
    }

    @objc private func closeButtonTapped(_ sender: UIBarButtonItem) {
        router.dismiss()
    }
}

extension LoginViewController: LoginView {
    func didLogin() {
        router.dismiss()
    }

    func didReceiveError(_ error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
    }
}
