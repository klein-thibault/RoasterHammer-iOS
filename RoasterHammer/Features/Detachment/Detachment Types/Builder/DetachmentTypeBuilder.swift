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
    func buildDataStore(armyId: Int) -> DetachmentTypeInteractor
}

final class DetachmentTypeBuilder: FeatureBuilderBase, DetachmentTypeBuildable {
    func buildDataStore(armyId: Int) -> DetachmentTypeInteractor {
        let detachmentDataManager = DetachmentDataManager(environmentManager: dependencyManager.environmentManager)
        let interactor = DetachmentTypeInteractor(detachmentDataManager: detachmentDataManager,
                                                  armyId: armyId)
        return interactor
    }
}
