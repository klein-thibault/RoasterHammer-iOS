//
//  CreateAccountViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/25/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class CreateAccountViewController: CreateAccountLayoutViewController {
    var interactor: CreateAccountInteractor!
    private let dataManager = AccountDataManager()

    override init() {
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped(_:)), for: .touchUpInside)
    }

    @objc private func createAccountButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {
            return
        }

        interactor.createAccount(email: email, password: password)
    }

}

extension CreateAccountViewController: CreateAccountView {
    func didRegister() {
        let alert = Alerter().informationalAlert(title: "Register", message: "You successfully registered")
        present(alert, animated: true, completion: nil)
    }

    func didReceiveError(_ error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
    }
}
