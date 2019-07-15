//
//  EditModelBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 7/15/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

protocol EditModelBuildable {
    func buildDataStore(selectedModel: SelectedModelResponse,
                        rosterInteractor: RoasterInteractor) -> EditModelInteractor
}

final class EditModelBuilder: FeatureBuilderBase, EditModelBuildable {
    func buildDataStore(selectedModel: SelectedModelResponse,
                        rosterInteractor: RoasterInteractor) -> EditModelInteractor {
        let unitDataManager = UnitDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = EditModelInteractor(selectedModel: selectedModel,
                                             rosterInteractor: rosterInteractor,
                                             unitDataManager: unitDataManager)

        return interactor
    }
}
