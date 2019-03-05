//
//  DetachmentTypeBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol DetachmentTypeBuildable {
    func build(armyId: Int, roaster: RoasterResponse) -> UIViewController
}

final class DetachmentTypeBuilder: FeatureBuilderBase, DetachmentTypeBuildable {
    func build(armyId: Int, roaster: RoasterResponse) -> UIViewController {
        let detachmentDataManager = DetachmentDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = DetachmentTypeInteractor(detachmentDataManager: detachmentDataManager)
        let presenter = DetachmentTypePresenter()
        let view = DetachmentTypeViewController(armyId: armyId, roaster: roaster)
        let router = DetachmentTypeRouter(dependencyManager: dependencyManager)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
