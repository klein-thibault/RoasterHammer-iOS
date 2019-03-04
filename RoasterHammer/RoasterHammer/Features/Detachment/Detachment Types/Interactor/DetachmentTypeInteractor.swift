//
//  DetachmentTypeInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class DetachmentTypeInteractor: DetachmentTypeViewOutput {
    var presenter: DetachmentTypeInteractorOutput!
    private let detachmentDataManager: DetachmentDataManager

    init(detachmentDataManager: DetachmentDataManager) {
        self.detachmentDataManager = detachmentDataManager
    }

    func getDetachmentTypes() {
        detachmentDataManager.getDetachmentTypes { [weak self] (detachmentTypes, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let detachmentTypes = detachmentTypes {
                self?.presenter.didReceiveDetachmentTypes(detachmentTypes: detachmentTypes)
            }
        }
    }

    func createDetachment(ofType type: DetachmentShortResponse,
                          forRoaster roaster: RoasterResponse,
                          inArmy armyId: Int) {
        detachmentDataManager.createDetachment(armyId: armyId, selectedDetachmentType: type) { [weak self] (detachment, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let detachment = detachment {
                self?.detachmentDataManager.addDetachmentToRoaster(roasterId: roaster.id,
                                                             detachmentId: detachment.id,
                                                             completion: { (roaster, error) in
                                                                if let error = error {
                                                                    self?.presenter.didReceiveError(error: error)
                                                                } else if let roaster = roaster {
                                                                    self?.presenter.didCreateNewDetachmentInRoaster(roaster: roaster)
                                                                }
                })
            }
        }
    }
}
