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
    func build(detachment: DetachmentResponse,
               selectedUnit: SelectedUnitResponse,
               delegate: RoasterDetachmentUpdateDelegate?) -> UIViewController
}

final class EditUnitBuilder: FeatureBuilderBase, EditUnitBuildable {
    func build(detachment: DetachmentResponse,
               selectedUnit: SelectedUnitResponse,
               delegate: RoasterDetachmentUpdateDelegate?) -> UIViewController {
        let unitDataManager = UnitDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = EditUnitInteractor(unitDataManager: unitDataManager,
                                            selectedUnit: selectedUnit,
                                            delegate: delegate)
        let presenter = EditUnitPresenter()
        let view = EditUnitViewController(detachment: detachment, unit: selectedUnit)
        let router = EditUnitRouter(dependencyManager: dependencyManager)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
