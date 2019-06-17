//
//  RoastersBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol RoastersBuildable {
    func buildDataStore() -> RoastersInteractor
}

final class RoastersBuilder: FeatureBuilderBase, RoastersBuildable {
    func buildDataStore() -> RoastersInteractor {
        let environmentManager = dependencyManager.environmentManager
        let accountDataManager = AccountDataManager(environmentManager: environmentManager)
        let roastersDataManager = RoasterDataManager(environmentManager: environmentManager)
        let interactor = RoastersInteractor(accountDataManager: accountDataManager, roastersDataManager: roastersDataManager)

        return interactor
    }
}
