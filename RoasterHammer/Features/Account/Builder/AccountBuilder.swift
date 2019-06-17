//
//  AccountBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol AccountBuildable {
    func buildDataStore() -> AccountInteractor
}

final class AccountBuilder: FeatureBuilderBase, AccountBuildable {
    func buildDataStore() -> AccountInteractor {
        let accountDataManager = AccountDataManager(environmentManager: dependencyManager.environmentManager)
        let gameDataManager = GameDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = AccountInteractor(accountDataManager: accountDataManager, gameDataManager: gameDataManager)

        return interactor
    }
}
