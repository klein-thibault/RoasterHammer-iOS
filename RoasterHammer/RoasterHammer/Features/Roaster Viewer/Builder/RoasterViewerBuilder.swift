//
//  RoasterViewerBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/27/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

protocol RoasterViewerBuildable {
    func build(roaster: RoasterResponse) -> UIViewController
    func buildWithNavigationController(roaster: RoasterResponse) -> UINavigationController
}

final class RoasterViewerBuilder: FeatureBuilderBase, RoasterViewerBuildable {
    func build(roaster: RoasterResponse) -> UIViewController {
        let interactor = RoasterViewerInteractor()
        let presenter = RoasterViewerPresenter()
        let view = RoasterViewerViewController(roaster: roaster)
        let router = RoasterViewerRouter()

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }

    func buildWithNavigationController(roaster: RoasterResponse) -> UINavigationController {
        let view = build(roaster: roaster)
        let navigationController = UINavigationController(rootViewController: view)

        return navigationController
    }
}
