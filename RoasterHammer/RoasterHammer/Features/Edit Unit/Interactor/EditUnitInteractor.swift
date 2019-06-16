//
//  EditUnitInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

final class EditUnitInteractor: EditUnitViewOutput {
    var presenter: EditUnitInteractorOutput!
    private let unitDataManager: UnitDataManager
    private let selectedUnit: SelectedUnitResponse
    private weak var delegate: RoasterDetachmentUpdateDelegate?

    init(unitDataManager: UnitDataManager,
         selectedUnit: SelectedUnitResponse,
         delegate: RoasterDetachmentUpdateDelegate?) {
        self.unitDataManager = unitDataManager
        self.selectedUnit = selectedUnit
        self.delegate = delegate
    }

    func addModel(_ modelId: Int, toUnit unitId: Int, inDetachment detachmentId: Int) {
        unitDataManager.addModelToUnit(detachmentId: detachmentId, unitId: unitId, modelId: modelId) { [weak self] (detachment, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let detachment = detachment {
                self?.handleDetachmentUpdate(detachment: detachment)
            }
        }
    }

    func removeModel(_ modelId: Int, fromUnit unitId: Int, inDetachment detachmentId: Int) {
        unitDataManager.removeModelFromUnit(detachmentId: detachmentId, unitId: unitId, modelId: modelId) { [weak self] (detachment, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let detachment = detachment {
                self?.handleDetachmentUpdate(detachment: detachment)
            }
        }
    }

    func roasterDidReceiveDetachmentUpdate(detachment: DetachmentResponse) {
        handleDetachmentUpdate(detachment: detachment)
    }

    // MARK: - Private Functions

    private func findSelectedUnit(forUnitId unitId: Int,
                                  inDetachment detachment: DetachmentResponse) -> SelectedUnitResponse? {
        return detachment.roles.flatMap({ $0.units }).first(where: { $0.id == unitId })
    }

    private func handleDetachmentUpdate(detachment: DetachmentResponse) {
        delegate?.roasterDidReceiveDetachmentUpdate(detachment: detachment)

        if let updatedUnit = findSelectedUnit(forUnitId: selectedUnit.id, inDetachment: detachment) {
            presenter.didReceiveSelectedUnit(unit: updatedUnit)
        }
    }

}
