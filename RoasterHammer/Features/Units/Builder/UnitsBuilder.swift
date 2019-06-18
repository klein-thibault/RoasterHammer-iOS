//
//  UnitsBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

protocol UnitsBuildable {
    func buildDataStore(filters: UnitFilters, detachmentId: Int, unitRoleId: Int) -> UnitsInteractor
}

final class UnitsBuilder: FeatureBuilderBase, UnitsBuildable {
    func buildDataStore(filters: UnitFilters, detachmentId: Int, unitRoleId: Int) -> UnitsInteractor {
        let unitDataManager = UnitDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = UnitsInteractor(unitDataManager: unitDataManager,
                                         filters: filters,
                                         detachmentId: detachmentId,
                                         unitRoleId: unitRoleId)


        return interactor
    }
}
