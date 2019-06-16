//
//  AccountInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class AccountInteractor: AccountViewOutput {
    var presenter: AccountInteractorOutput!
    private let accountDataManager: AccountDataManager
    private let gameDataManager: GameDataManager

    init(accountDataManager: AccountDataManager,
         gameDataManager: GameDataManager) {
        self.accountDataManager = accountDataManager
        self.gameDataManager = gameDataManager
    }

    func logoutButtonTapped() {
        accountDataManager.logout()
        gameDataManager.deleteGameLocally()
        presenter.shouldDismissView()
    }
}
