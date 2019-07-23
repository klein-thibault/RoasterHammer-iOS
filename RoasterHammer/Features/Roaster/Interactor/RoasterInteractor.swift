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

final class RoasterInteractor: BindableObject {
    var roaster: RoasterResponse {
        didSet {
            willChange.send(self)
        }
    }

    private let roasterDataManager: RoasterDataManager
    private let unitDataManager: UnitDataManager

    var willChange = PassthroughSubject<RoasterInteractor, Never>()

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

    func setDetachmentFaction(factionId: Int, detachmentId: Int, rosterId: Int) {
        roasterDataManager.setDetachmentFaction(factionId: factionId,
                                                detachmentId: detachmentId,
                                                rosterId: rosterId) { [weak self] (roster, error) in
                                                    if let roster = roster {
                                                        self?.roaster = roster
                                                    }
        }
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
}
