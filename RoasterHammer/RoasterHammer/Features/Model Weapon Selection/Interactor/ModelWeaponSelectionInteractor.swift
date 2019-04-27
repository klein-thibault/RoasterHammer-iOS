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
    private weak var delegate: RoasterDetachmentUpdateDelegate?
    private let unitDataManager: UnitDataManager

    init(unitDataManager: UnitDataManager, delegate: RoasterDetachmentUpdateDelegate?) {
        self.unitDataManager = unitDataManager
        self.delegate = delegate
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
        // Consider revisiting the data structure to avoid a triple loop
        for role in detachment.roles {
            for unit in role.units {
                for model in unit.models {
                    if model.id == modelId {
                        return unit
                    }
                }
            }
        }

        return nil
    }

    private func handleCompletion(modelId: Int, detachment: DetachmentResponse?, error: Error?) {
        if let error = error {
            presenter.didReceiveError(error: error)
        } else if let detachment = detachment {
            delegate?.roasterDidReceiveDetachmentUpdate(detachment: detachment)
            if let selectedUnit = findSelectedUnit(forModelId: modelId, inDetachment: detachment) {
                presenter.didReceiveSelectedUnit(unit: selectedUnit)
            }
        }
    }
}
