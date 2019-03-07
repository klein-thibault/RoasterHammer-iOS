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
    private let roastersDataManager: RoasterDataManager

    init(accountDataManager: AccountDataManager,
         roastersDataManager: RoasterDataManager) {
        self.accountDataManager = accountDataManager
        self.roastersDataManager = roastersDataManager
    }

    func getRoasters() {
        roastersDataManager.getRoasters { [weak self] (roasters, error) in
            if let roasters = roasters {
                self?.presenter.didReceiveRoasters(roasters: roasters)
            } else if let error = error {
                self?.presenter.didReceiveError(error)
            }
        }
    }

    func accountButtonTapped() {
        if !accountDataManager.isUserLoggedIn() {
            presenter.shouldPresentLoginView()
        } else {
            presenter.shouldPresentAccountView()
        }
    }

    func addRoasterButtonTappedWithName(_ name: String) {
        roastersDataManager.createRoaster(name: name) { [weak self] (roaster, error) in
            if let error = error {
                self?.presenter.didReceiveError(error)
            } else if roaster != nil {
                self?.roastersDataManager.getRoasters(completion: { (roasters, error) in
                    if let error = error {
                        self?.presenter.didReceiveError(error)
                    } else if let roasters = roasters {
                        self?.presenter.didReceiveRoasters(roasters: roasters)
                    }
                })
            }
        }
    }
}
