//
//  RoastersInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class RoastersInteractor: RoastersViewOutput {
    var presenter: RoastersInteractorOutput!
    private let accountDataManager: AccountDataManager

    init(accountDataManager: AccountDataManager) {
        self.accountDataManager = accountDataManager
    }

    func getRoasters() {
        // TODO
    }

    func accountButtonTapped() {
        if !accountDataManager.isUserLoggedIn() {
            presenter.shouldPresentLoginView()
        }
        // TODO: if user is logged in, inform presenter to show the account page
    }

    func addRoasterButtonTapped() {
        // TODO
    }


}
