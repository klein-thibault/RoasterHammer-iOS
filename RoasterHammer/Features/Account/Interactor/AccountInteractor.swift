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
    var presenter: AccountInteractorOutput!
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

    func logoutButtonTapped() {
        accountDataManager.logout()
        gameDataManager.deleteGameLocally()
        presenter.shouldDismissView()
    }
}
