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

    init(accountDataManager: AccountDataManager) {
        self.accountDataManager = accountDataManager
    }

    func logoutButtonTapped() {
        accountDataManager.logout()
        presenter.shouldDismissView()
    }
}
