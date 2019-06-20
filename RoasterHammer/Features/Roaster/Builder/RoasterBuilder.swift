//
//  RoasterBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

protocol RoasterBuildable {
    func buildDataStore(roaster: RoasterResponse) -> RoasterInteractor
}

final class RoasterBuilder: FeatureBuilderBase, RoasterBuildable {
    func buildDataStore(roaster: RoasterResponse) -> RoasterInteractor {
        let roasterDataManager = RoasterDataManager(environmentManager: dependencyManager.environmentManager)
        let unitDataManager = UnitDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = RoasterInteractor(roasterDataManager: roasterDataManager,
                                           unitDataManager: unitDataManager,
                                           roaster: roaster)

        return interactor
    }
}
