//
//  DetachmentTypeInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RoasterHammer_Shared

final class DetachmentTypeInteractor: DetachmentTypeViewOutput, BindableObject {
    var detachmentTypes: [DetachmentShortResponse] = [] {
        didSet {
            didChange.send(self)
        }
    }
    var armyId: Int
    var roaster: RoasterResponse
    var presenter: DetachmentTypeInteractorOutput!
    private let detachmentDataManager: DetachmentDataManager

    var didChange = PassthroughSubject<DetachmentTypeInteractor, Never>()

    init(detachmentDataManager: DetachmentDataManager, armyId: Int, roaster: RoasterResponse) {
        self.detachmentDataManager = detachmentDataManager
        self.armyId = armyId
        self.roaster = roaster
    }

    func getDetachmentTypes() {
        detachmentDataManager.getDetachmentTypes { [weak self] (detachmentTypes, error) in
            if let detachmentTypes = detachmentTypes {
                self?.detachmentTypes = detachmentTypes
            }
        }
    }

    func createDetachment(ofType type: DetachmentShortResponse) {
        detachmentDataManager.createDetachment(armyId: armyId, selectedDetachmentType: type) { [weak self] (detachment, error) in
            if let detachment = detachment, let roasterId = self?.roaster.id {
                self?.detachmentDataManager.addDetachmentToRoaster(roasterId: roasterId,
                                                                   detachmentId: detachment.id,
                                                                   completion: { (roaster, error) in
                                                                    if let roaster = roaster {
                                                                        self?.roaster = roaster
                                                                    }
                })
            }
        }
    }
}
