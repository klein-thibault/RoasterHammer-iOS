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
    func build(selectedModel: SelectedModelResponse) -> UIViewController
}

final class ModelWeaponSelectionBuilder: FeatureBuilderBase, ModelWeaponSelectionBuildable {
    func build(selectedModel: SelectedModelResponse) -> UIViewController {
        let interactor = ModelWeaponSelectionInteractor()
        let presenter = ModelWeaponSelectionPresenter()
        let view = ModelWeaponSelectionViewController(selectedModel: selectedModel)

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
