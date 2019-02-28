//
//  CreateAccountInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class CreateAccountInteractor: CreateAccountViewOutput {
    var presenter: CreateAccountInteractorOutput!
    private let dataManager: AccountDataManager

    init(dataManager: AccountDataManager) {
        self.dataManager = dataManager
    }

    func createAccount(email: String, password: String) {
        dataManager.createAccount(email: email, password: password) { [weak self] (user, error) in
            if let error = error {
                self?.presenter.didReceiveError(error)
            }

            self?.presenter.didRegister()
        }
    }
}
