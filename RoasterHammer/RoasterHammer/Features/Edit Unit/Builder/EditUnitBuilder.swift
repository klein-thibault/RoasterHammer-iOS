//
//  EditUnitBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

protocol EditUnitBuildable {
    func build(detachment: DetachmentResponse, unit: SelectedUnitResponse) -> UIViewController
}

final class EditUnitBuilder: FeatureBuilderBase, EditUnitBuildable {
    func build(detachment: DetachmentResponse, unit: SelectedUnitResponse) -> UIViewController {
        let unitDataManager = UnitDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = EditUnitInteractor(unitDataManager: unitDataManager)
        let presenter = EditUnitPresenter()
        let view = EditUnitViewController(detachment: detachment, unit: unit)

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
