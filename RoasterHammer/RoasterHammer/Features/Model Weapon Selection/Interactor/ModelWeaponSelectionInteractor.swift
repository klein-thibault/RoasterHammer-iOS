//
//  ModelWeaponSelectionInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class ModelWeaponSelectionInteractor: ModelWeaponSelectionViewOutput {
    var presenter: ModelWeaponSelectionInteractorOutput!
    private let unitDataManager: UnitDataManager

    init(unitDataManager: UnitDataManager) {
        self.unitDataManager = unitDataManager
    }

    // MARK: - Public Functions

    func attachWeaponToSelectedModel(_ weaponId: Int,
                                     fromWeaponBucket weaponBucketId: Int,
                                     forModel modelId: Int,
                                     inDetachment detachmentId: Int) {
        unitDataManager.attachWeaponToModel(detachmentId: detachmentId,
                                            modelId: modelId,
                                            weaponBucketId: weaponBucketId,
                                            weaponId: weaponId) { [weak self] (detachment, error) in
                                                self?.handleCompletion(modelId: modelId, detachment: detachment, error: error)
        }
    }

    func detachWeaponFromSelectedModel(_ weaponId: Int,
                                       fromWeaponBucket weaponBucketId: Int,
                                       forModel modelId: Int,
                                       inDetachment detachmentId: Int) {
        unitDataManager.detachWeaponFromModel(detachmentId: detachmentId,
                                              modelId: modelId,
                                              weaponBucketId: weaponBucketId,
                                              weaponId: weaponId) { [weak self] (detachment, error) in
                                                self?.handleCompletion(modelId: modelId, detachment: detachment, error: error)
        }
    }

    // MARK: - Private Functions

    private func findSelectedUnit(forModelId modelId: Int,
                                  inDetachment detachment: DetachmentResponse) -> SelectedUnitResponse? {
        return detachment.roles
            .flatMap({ $0.units })
            .first(where: { unit in
                return unit.models.filter({ $0.model.id == modelId }).count > 0
            })
    }

    private func handleCompletion(modelId: Int, detachment: DetachmentResponse?, error: Error?) {
        if let error = error {
            presenter.didReceiveError(error: error)
        } else if let detachment = detachment,
            let selectedUnit = findSelectedUnit(forModelId: modelId, inDetachment: detachment) {
            presenter.didReceiveSelectedUnit(unit: selectedUnit)
        }
    }
}