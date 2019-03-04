//
//  RoasterBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

protocol RoasterBuildable {
    func build(roaster: RoasterResponse) -> UIViewController
}

final class RoasterBuilder: FeatureBuilderBase, RoasterBuildable {
    func build(roaster: RoasterResponse) -> UIViewController {
        let interactor = RoasterInteractor()
        let presenter = RoasterPresenter()
        let view = RoasterViewController(roaster: roaster)
        let router = RoasterRouter(dependencyManager: dependencyManager)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
