//
//  ArmiesBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

protocol ArmiesBuildable {
    func build(roaster: RoasterResponse) -> UIViewController
}

final class ArmiesBuilder: FeatureBuilderBase, ArmiesBuildable {
    func build(roaster: RoasterResponse) -> UIViewController {
        let armyDataManager = ArmyDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = ArmiesInteractor(armyDataManager: armyDataManager)
        let presenter = ArmiesPresenter()
        let view = ArmiesViewController()

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
