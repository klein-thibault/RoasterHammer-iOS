//
//  CreateAccountLayoutViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/25/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class CreateAccountLayoutViewController: UIViewController {

    var fieldsStackView: UIStackView
    var emailTextField: UITextField
    var passwordTextField: UITextField
    var createAccountButton: UIButton

    init() {
        emailTextField = UITextField()
        passwordTextField = UITextField()
        createAccountButton = UIButton()
        fieldsStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, createAccountButton])
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        createAccountButton.setTitle("Create Account", for: .normal)

        view.addSubview(fieldsStackView)
        fieldsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        fieldsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 15).isActive = true
        fieldsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        fieldsStackView.heightAnchor.constraint(equalToConstant: 300)
    }

}
