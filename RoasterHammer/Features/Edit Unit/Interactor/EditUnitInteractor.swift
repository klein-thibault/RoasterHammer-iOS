//
//  EditUnitInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 7/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RoasterHammer_Shared

final class EditUnitInteractor: BindableObject {
    var selectedUnit: SelectedUnitResponse {
        didSet {
            didChange.send(self)
        }
    }
    var didChange = PassthroughSubject<EditUnitInteractor, Never>()

    private let rosterInteractor: RoasterInteractor
    private let unitDataManager: UnitDataManager

    init(selectedUnit: SelectedUnitResponse,
         rosterInteractor: RoasterInteractor,
         unitDataManager: UnitDataManager) {
        self.selectedUnit = selectedUnit
        self.rosterInteractor = rosterInteractor
        self.unitDataManager = unitDataManager
    }

    // MARK: - Public Functions

    func addModel(_ modelId: Int, toUnit unitId: Int, inDetachment detachmentId: Int) {
        unitDataManager.addModelToUnit(detachmentId: detachmentId, unitId: unitId, modelId: modelId) { [weak self] (detachment, error) in
            self?.handleUnitUpdate(unitId: unitId, inDetachment: detachmentId)
        }
    }

    func setUnitAsWarlord(detachmentId: Int, roleId: Int, unitId: Int) {
        unitDataManager.setUnitAsWarlord(detachmentId: detachmentId,
                                         roleId: roleId,
                                         unitId: unitId) { [weak self] (detachment, error) in
                                            self?.handleUnitUpdate(unitId: unitId, inDetachment: detachmentId)
        }
    }

    // MARK: - Private Functions

    private func handleUnitUpdate(unitId: Int, inDetachment detachmentId: Int) {
        rosterInteractor.getRoasterById(roasterId: rosterInteractor.roaster.id, completion: {
            guard let detachment = self.rosterInteractor.findDetachment(forDetachmentId: detachmentId),
                let selectedUnitResponse = self.rosterInteractor.findSelectedUnit(forUnitId: unitId, inDetachment: detachment)else {
                    return
            }

            self.selectedUnit = selectedUnitResponse
        })
    }
}
