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

    var presenter: DetachmentTypeInteractorOutput!
    private let detachmentDataManager: DetachmentDataManager

    var didChange = PassthroughSubject<DetachmentTypeInteractor, Never>()

    init(detachmentDataManager: DetachmentDataManager, armyId: Int) {
        self.detachmentDataManager = detachmentDataManager
        self.armyId = armyId
    }

    func getDetachmentTypes() {
        detachmentDataManager.getDetachmentTypes { [weak self] (detachmentTypes, error) in
            if let detachmentTypes = detachmentTypes {
                self?.detachmentTypes = detachmentTypes
            }
        }
    }

    func createDetachment(ofType type: DetachmentShortResponse, forRoster rosterData: RoasterInteractor) {
        detachmentDataManager.createDetachment(armyId: armyId, selectedDetachmentType: type) { [weak self] (detachment, error) in
            if let detachment = detachment {
                self?.detachmentDataManager.addDetachmentToRoaster(roasterId: rosterData.roaster.id,
                                                                   detachmentId: detachment.id,
                                                                   completion: { (newRoster, error) in
                                                                    if let newRoster = newRoster {
                                                                        rosterData.roaster = newRoster
                                                                    }
                })
            }
        }
    }
}
