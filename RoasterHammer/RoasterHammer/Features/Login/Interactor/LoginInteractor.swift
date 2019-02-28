//
//  LoginInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class LoginInteractor: LoginViewOutput {
    var presenter: LoginInteractorOutput!
    private let dataManager: AccountDataManager

    init(dataManager: AccountDataManager) {
        self.dataManager = dataManager
    }

    func login(email: String, password: String) {
        dataManager.login(email: email, password: password) { [weak self] (token, error) in
            if let error = error {
                self?.presenter.didReceiveError(error)
            }

            self?.presenter.didLogin()
        }
    }

}
