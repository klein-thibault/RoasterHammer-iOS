//
//  AccountInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class AccountInteractor: AccountViewOutput, BindableObject {
    var token: String? {
        didSet {
            didChange.send(self)
        }
    }
    private let accountDataManager: AccountDataManager
    private let gameDataManager: GameDataManager

    var didChange = PassthroughSubject<AccountInteractor, Never>()

    init(accountDataManager: AccountDataManager,
         gameDataManager: GameDataManager) {
        self.accountDataManager = accountDataManager
        self.gameDataManager = gameDataManager
    }

    func isUserLoggedIn() -> Bool {
        return accountDataManager.isUserLoggedIn()
    }

    func logout() {
        accountDataManager.logout()
        gameDataManager.deleteGameLocally()
        token = nil
    }

    func login(email: String, password: String) {
        accountDataManager.login(email: email, password: password) { [weak self] (token, error) in
            self?.token = token
        }
    }

    func createAccount(email: String, password: String) {
        accountDataManager.createAccount(email: email, password: password) { [weak self] (user, error) in
            // Login automatically the user after creating an account
            self?.accountDataManager.login(email: email, password: password, completion: { (token, error) in
                self?.token = token
            })
        }
    }
}
