//
//  EditModelInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 7/15/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RoasterHammer_Shared

final class EditModelInteractor: BindableObject {
    var selectedModel: SelectedModelResponse {
        didSet {
            didChange.send(self)
        }
    }
    var didChange = PassthroughSubject<EditModelInteractor, Never>()
    let rosterInteractor: RoasterInteractor

    private let unitDataManager: UnitDataManager

    init(selectedModel: SelectedModelResponse,
         rosterInteractor: RoasterInteractor,
         unitDataManager: UnitDataManager) {
        self.selectedModel = selectedModel
        self.rosterInteractor = rosterInteractor
        self.unitDataManager = unitDataManager
    }

    // MARK: - Public Functions

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
        }
    }

    // MARK: - Private Functions

    private func handleModelUpdate(unitId: Int, modelId: Int, inDetachment detachmentId: Int) {
        rosterInteractor.getRoasterById(roasterId: rosterInteractor.roaster.id, completion: {
            guard let detachment = self.rosterInteractor.findDetachment(forDetachmentId: detachmentId) else {
                return
            }

            let selectedUnitResponse = self.rosterInteractor.findSelectedUnit(forUnitId: unitId, inDetachment: detachment)

            if let selectedModelResponse = selectedUnitResponse?.models.first(where: { $0.id == modelId }) {
                self.selectedModel = selectedModelResponse
            }
        })
    }

}
