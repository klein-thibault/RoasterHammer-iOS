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
    func build(unit: SelectedUnitResponse) -> UIViewController
}

final class EditUnitBuilder: FeatureBuilderBase, EditUnitBuildable {
    func build(unit: SelectedUnitResponse) -> UIViewController {
        let interactor = EditUnitInteractor()
        let presenter = EditUnitPresenter()
        let view = EditUnitViewController(unit: unit)

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
