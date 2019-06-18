//
//  ArmiesBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

protocol ArmiesBuildable {
    func buildDataStore() -> ArmiesInteractor
}

final class ArmiesBuilder: FeatureBuilderBase, ArmiesBuildable {
    func buildDataStore() -> ArmiesInteractor {
        let armyDataManager = ArmyDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = ArmiesInteractor(armyDataManager: armyDataManager)

        return interactor
    }
}
