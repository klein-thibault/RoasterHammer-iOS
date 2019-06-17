//
//  RoastersInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RoasterHammer_Shared

final class RoastersInteractor: RoastersViewOutput, BindableObject {
    var presenter: RoastersInteractorOutput!
    var roasters: [RoasterResponse] = [] {
        didSet {
            didChange.send(self)
        }
    }
    var didChange = PassthroughSubject<RoastersInteractor, Never>()

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
                self?.roasters = roasters
            } else if let _ = error {
                self?.roasters = []
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
