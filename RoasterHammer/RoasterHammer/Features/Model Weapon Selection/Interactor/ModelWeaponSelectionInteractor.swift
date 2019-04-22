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
                                            weaponId: weaponId) { [weak self] (detachmnent, error) in
                                                if let error = error {
                                                    self?.presenter.didReceiveError(error: error)
                                                } else if let detachment = detachmnent,
                                                    let selectedUnit = self?.findSelectedUnit(forModelId: modelId, inDetachment: detachment) {
                                                    self?.presenter.didReceiveSelectedUnit(unit: selectedUnit)
                                                }
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
}
