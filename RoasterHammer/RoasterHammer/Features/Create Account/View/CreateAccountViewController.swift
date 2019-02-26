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
    private let dataManager = CreateAccountDataManager()

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

        dataManager.createAccount(email: email, password: password) { (user, error) in
            print(user)
            print(error)
        }
    }

}
