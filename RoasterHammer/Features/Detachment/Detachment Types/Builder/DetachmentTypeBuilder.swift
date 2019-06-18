//
//  DetachmentTypeBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

protocol DetachmentTypeBuildable {
    func build(armyId: Int, roaster: RoasterResponse) -> UIViewController
    func buildDataStore(armyId: Int, roaster: RoasterResponse) -> DetachmentTypeInteractor
}

final class DetachmentTypeBuilder: FeatureBuilderBase, DetachmentTypeBuildable {
    func build(armyId: Int, roaster: RoasterResponse) -> UIViewController {
        let detachmentDataManager = DetachmentDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = DetachmentTypeInteractor(detachmentDataManager: detachmentDataManager,
                                                  armyId: armyId,
                                                  roaster: roaster)
        let presenter = DetachmentTypePresenter()
        let view = DetachmentTypeViewController(armyId: armyId, roaster: roaster)
        let router = DetachmentTypeRouter(dependencyManager: dependencyManager)

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return view
    }

    func buildDataStore(armyId: Int, roaster: RoasterResponse) -> DetachmentTypeInteractor {
        let detachmentDataManager = DetachmentDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = DetachmentTypeInteractor(detachmentDataManager: detachmentDataManager,
                                                  armyId: armyId,
                                                  roaster: roaster)
        return interactor
    }
}
