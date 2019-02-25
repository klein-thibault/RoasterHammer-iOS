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

    init() {
        emailTextField = UITextField()
        passwordTextField = UITextField()
        fieldsStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(fieldsStackView)
        fieldsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fieldsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        fieldsStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

}
