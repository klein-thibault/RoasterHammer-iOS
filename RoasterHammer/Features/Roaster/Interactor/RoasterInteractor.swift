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
    var presenter: RoasterInteractorOutput!
    private let roasterDataManager: RoasterDataManager
    private let unitDataManager: UnitDataManager
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

    func deleteUnit(_ unitId: Int,
                    fromDetachment detachmentId: Int,
                    fromRoaster roasterId: Int,
                    inUnitRole unitRoleId: Int) {
        unitDataManager.removeUnitFromDetachment(detachmentId: detachmentId,
                                                 unitRoleId: unitRoleId,
                                                 unitId: unitId) { [weak self] (detachment, error) in
                                                    if let error = error {
                                                        self?.presenter.didReceiveError(error: error)
                                                    } else {
                                                        self?.getRoasterById(roasterId: roasterId)
                                                    }
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

    func addModel(_ modelId: Int, toUnit unitId: Int, inDetachment detachmentId: Int) {
        unitDataManager.addModelToUnit(detachmentId: detachmentId, unitId: unitId, modelId: modelId) { [weak self] (detachment, error) in
            self?.handleModelUpdate(modelId: modelId, toUnit: unitId, inDetachment: detachmentId)
        }
    }

    func removeModel(_ modelId: Int, fromUnit unitId: Int, inDetachment detachmentId: Int) {
        unitDataManager.removeModelFromUnit(detachmentId: detachmentId, unitId: unitId, modelId: modelId) { [weak self] (detachment, error) in
            self?.handleModelUpdate(modelId: modelId, toUnit: unitId, inDetachment: detachmentId)
        }
    }

    func roasterDidReceiveDetachmentUpdate(detachment: DetachmentResponse) {
        getRoasterById(roasterId: roaster.id)
    }

    // MARK: - Private Functions

    private func getRoasterById(roasterId: Int, completion: (() -> Void)? = nil) {
        roasterDataManager.getRoaster(byRoasterId: roasterId) { [weak self] (roaster, error) in
            if let roaster = roaster {
                self?.roaster = roaster
            }

            _ = completion
        }
    }

    private func findDetachment(forDetachmentId detachmentId: Int) -> DetachmentResponse? {
        return roaster.detachments.first(where: { $0.id == detachmentId})
    }

    private func findSelectedUnit(forUnitId unitId: Int,
                                  inDetachment detachment: DetachmentResponse) -> SelectedUnitResponse? {
        return detachment.roles.flatMap({ $0.units }).first(where: { $0.id == unitId })
    }

    private func handleModelUpdate(modelId: Int, toUnit unitId: Int, inDetachment detachmentId: Int) {
        getRoasterById(roasterId: roaster.id, completion: {
            guard let detachment = self.findDetachment(forDetachmentId: detachmentId) else {
                return
            }
            let selectedUnitResponse = self.findSelectedUnit(forUnitId: unitId, inDetachment: detachment)
            self.selectedUnit = selectedUnitResponse
        })
    }
}
