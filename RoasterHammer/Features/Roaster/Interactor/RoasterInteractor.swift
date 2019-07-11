//
//  RoasterInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RoasterHammer_Shared

final class RoasterInteractor: RoasterViewOutput, BindableObject {
    var roaster: RoasterResponse {
        didSet {
            didChange.send(self)
        }
    }
    var selectedUnit: SelectedUnitResponse? {
        didSet {
            didChange.send(self)
        }
    }
    var selectedModel: SelectedModelResponse? {
        didSet {
            didChange.send(self)
        }
    }

    private let roasterDataManager: RoasterDataManager
    private let unitDataManager: UnitDataManager

    var didChange = PassthroughSubject<RoasterInteractor, Never>()

    init(roasterDataManager: RoasterDataManager,
         unitDataManager: UnitDataManager,
         roaster: RoasterResponse) {
        self.roasterDataManager = roasterDataManager
        self.unitDataManager = unitDataManager
        self.roaster = roaster
    }

    // MARK: - Public Functions

    func getRoasterDetails() {
        getRoasterById(roasterId: roaster.id)
    }

    func removeDetachment(detachmentId: Int, rosterId: Int) {
        roasterDataManager.removeDetachmentFromRoster(detachmentId: detachmentId,
                                                      rosterId: rosterId) { (roster, error) in
                                                        if let roster = roster {
                                                            self.roaster = roster
                                                        }
        }
    }

    func deleteUnit(_ unitId: Int,
                    fromDetachment detachmentId: Int,
                    fromRoaster roasterId: Int,
                    inUnitRole unitRoleId: Int) {
        unitDataManager.removeUnitFromDetachment(detachmentId: detachmentId,
                                                 unitRoleId: unitRoleId,
                                                 unitId: unitId) { [weak self] (detachment, error) in
                                                    self?.getRoasterById(roasterId: roasterId)
        }
    }

    func addUnitToDetachment(unitId: Int, detachmentId: Int, unitRoleId: Int, quantity: Int) {
        unitDataManager.addUnitToDetachment(detachmentId: detachmentId,
                                            unitRoleId: unitRoleId,
                                            unitId: unitId,
                                            quantity: quantity) { [weak self] (detachment, error) in
                                                self?.getRoasterDetails()
        }
    }

    func removeModel(_ modelId: Int, fromUnit unitId: Int, inDetachment detachmentId: Int) {
        unitDataManager.removeModelFromUnit(detachmentId: detachmentId, unitId: unitId, modelId: modelId) { [weak self] (detachment, error) in
            self?.handleUnitUpdate(unitId: unitId, inDetachment: detachmentId)
        }
    }

    func setWarlordTraitToUnit(warlordTraitId: Int, detachmentId: Int, roleId: Int, unitId: Int) {
        unitDataManager.setWarlordTraitToUnit(warlordTraitId: warlordTraitId,
                                              detachmentId: detachmentId,
                                              roleId: roleId,
                                              unitId: unitId) { [weak self] (detachment, error) in
                                                self?.handleUnitUpdate(unitId: unitId, inDetachment: detachmentId)
        }
    }

    func setRelicToUnit(relicId: Int, detachmentId: Int, roleId: Int, unitId: Int) {
        unitDataManager.setRelicToUnit(relicId: relicId,
                                       detachmentId: detachmentId,
                                       roleId: roleId,
                                       unitId: unitId) { [weak self] (detachment, error) in
                                        self?.handleUnitUpdate(unitId: unitId, inDetachment: detachmentId)
        }
    }

    func setPsychicPowerToUnit(unitId: Int,
                               detachmentId: Int,
                               psychicPowerId: Int) {
        unitDataManager.setPsychicPowerToUnit(unitId: unitId,
                                              detachmentId: detachmentId,
                                              psychicPowerId: psychicPowerId) { [weak self] (detachment, error) in
                                                self?.handleUnitUpdate(unitId: unitId, inDetachment: detachmentId)
        }
    }

    func unsetPsychicPowerFromUnit(unitId: Int,
                                   detachmentId: Int,
                                   psychicPowerId: Int) {
        unitDataManager.unsetPsychicPowerFromUnit(unitId: unitId,
                                              detachmentId: detachmentId,
                                              psychicPowerId: psychicPowerId) { [weak self] (detachment, error) in
                                                self?.handleUnitUpdate(unitId: unitId, inDetachment: detachmentId)
        }
    }

    func setDetachmentFaction(factionId: Int, detachmentId: Int, rosterId: Int) {
        roasterDataManager.setDetachmentFaction(factionId: factionId,
                                                detachmentId: detachmentId,
                                                rosterId: rosterId) { [weak self] (roster, error) in
                                                    if let roster = roster {
                                                        self?.roaster = roster
                                                    }
        }
    }

    func attachWeaponToSelectedModel(_ weaponId: Int,
                                     fromWeaponBucket weaponBucketId: Int,
                                     forModel modelId: Int,
                                     ofUnit unitId: Int,
                                     inDetachment detachmentId: Int) {
        unitDataManager.attachWeaponToModel(detachmentId: detachmentId,
                                            modelId: modelId,
                                            weaponBucketId: weaponBucketId,
                                            weaponId: weaponId) { [weak self] (detachment, error) in
                                                self?.handleModelUpdate(unitId: unitId, modelId: modelId, inDetachment: detachmentId)
        }
    }

    func detachWeaponFromSelectedModel(_ weaponId: Int,
                                       forModel modelId: Int,
                                       ofUnit unitId: Int,
                                       inDetachment detachmentId: Int) {
        unitDataManager.detachWeaponFromModel(detachmentId: detachmentId,
                                              modelId: modelId,
                                              weaponId: weaponId) { [weak self] (detachment, error) in
                                                self?.handleModelUpdate(unitId: unitId, modelId: modelId, inDetachment: detachmentId)
                                                self?.getRoasterDetails()
        }
    }

    // TODO: remove
    func roasterDidReceiveDetachmentUpdate(detachment: DetachmentResponse) {
        getRoasterById(roasterId: roaster.id)
    }

    func getRoasterById(roasterId: Int, completion: (() -> Void)? = nil) {
        roasterDataManager.getRoaster(byRoasterId: roasterId) { [weak self] (roaster, error) in
            if let roaster = roaster {
                self?.roaster = roaster
            }

            completion?()
        }
    }

    func findDetachment(forDetachmentId detachmentId: Int) -> DetachmentResponse? {
        return roaster.detachments.first(where: { $0.id == detachmentId})
    }

    func findSelectedUnit(forUnitId unitId: Int,
                          inDetachment detachment: DetachmentResponse) -> SelectedUnitResponse? {
        return detachment.roles.flatMap({ $0.units }).first(where: { $0.id == unitId })
    }

    // MARK: - Private Functions

    private func handleUnitUpdate(unitId: Int, inDetachment detachmentId: Int) {
        getRoasterById(roasterId: roaster.id, completion: {
            guard let detachment = self.findDetachment(forDetachmentId: detachmentId) else {
                return
            }
            let selectedUnitResponse = self.findSelectedUnit(forUnitId: unitId, inDetachment: detachment)
            self.selectedUnit = selectedUnitResponse
        })
    }

    private func handleModelUpdate(unitId: Int, modelId: Int, inDetachment detachmentId: Int) {
        getRoasterById(roasterId: roaster.id, completion: {
            guard let detachment = self.findDetachment(forDetachmentId: detachmentId) else {
                return
            }

            let selectedUnitResponse = self.findSelectedUnit(forUnitId: unitId, inDetachment: detachment)
            self.selectedUnit = selectedUnitResponse
            let selectedModelResponse = selectedUnitResponse?.models.first(where: { $0.id == modelId })
            self.selectedModel = selectedModelResponse
        })
    }
}
