//
//  EditUnitInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class EditUnitInteractor: EditUnitViewOutput {
    var presenter: EditUnitInteractorOutput!
    private let unitDataManager: UnitDataManager

    init(unitDataManager: UnitDataManager) {
        self.unitDataManager = unitDataManager
    }

    func addModel(_ modelId: Int, toUnit unitId: Int, inDetachment detachmentId: Int) {
        unitDataManager.addModelToUnit(detachmentId: detachmentId, unitId: unitId, modelId: modelId) { [weak self] (detachment, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let detachment = detachment,
                let updatedUnit = self?.findSelectedUnit(forUnitId: unitId, inDetachment: detachment) {
                self?.presenter.didReceiveSelectedUnit(unit: updatedUnit)
            }
        }
    }

    func removeModel(_ modelId: Int, fromUnit unitId: Int, inDetachment detachmentId: Int) {
        unitDataManager.removeModelFromUnit(detachmentId: detachmentId, unitId: unitId, modelId: modelId) { [weak self] (detachment, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let detachment = detachment,
                let updatedUnit = self?.findSelectedUnit(forUnitId: unitId, inDetachment: detachment) {
                self?.presenter.didReceiveSelectedUnit(unit: updatedUnit)
            }
        }
    }

    // MARK: - Private Functions

    private func findSelectedUnit(forUnitId unitId: Int,
                                  inDetachment detachment: DetachmentResponse) -> SelectedUnitResponse? {
        return detachment.roles.flatMap({ $0.units }).first(where: { $0.id == unitId })
    }
}
