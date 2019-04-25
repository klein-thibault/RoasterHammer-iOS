//
//  ModelWeaponSelectionBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

protocol ModelWeaponSelectionBuildable {
    func build(detachment: DetachmentResponse,
               selectedModel: SelectedModelResponse,
               delegate: ModelWeaponSelectionInteractorDelegate?) -> UIViewController
}

final class ModelWeaponSelectionBuilder: FeatureBuilderBase, ModelWeaponSelectionBuildable {
    func build(detachment: DetachmentResponse,
               selectedModel: SelectedModelResponse,
               delegate: ModelWeaponSelectionInteractorDelegate?) -> UIViewController {
        let unitDataManager = UnitDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = ModelWeaponSelectionInteractor(unitDataManager: unitDataManager, delegate: delegate)
        let presenter = ModelWeaponSelectionPresenter()
        let view = ModelWeaponSelectionViewController(detachment: detachment, selectedModel: selectedModel)

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
