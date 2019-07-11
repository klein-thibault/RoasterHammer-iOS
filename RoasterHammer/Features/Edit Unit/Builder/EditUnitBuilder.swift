//
//  EditUnitBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

protocol EditUnitBuildable {
    func buildDataStore(selectedUnit: SelectedUnitResponse,
                        rosterInteractor: RoasterInteractor) -> EditUnitInteractor
}

final class EditUnitBuilder: FeatureBuilderBase, EditUnitBuildable {
    func buildDataStore(selectedUnit: SelectedUnitResponse,
                        rosterInteractor: RoasterInteractor) -> EditUnitInteractor {
        let unitDataManager = UnitDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = EditUnitInteractor(selectedUnit: selectedUnit,
                                            rosterInteractor: rosterInteractor,
                                            unitDataManager: unitDataManager)

        return interactor
    }
}
