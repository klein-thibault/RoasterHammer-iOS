//
//  RoasterInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class RoasterInteractor: RoasterViewOutput {
    var presenter: RoasterInteractorOutput!
    private let roasterDataManager: RoasterDataManager
    private let unitDataManager: UnitDataManager
    private let roaster: RoasterResponse

    init(roasterDataManager: RoasterDataManager,
         unitDataManager: UnitDataManager,
         roaster: RoasterResponse) {
        self.roasterDataManager = roasterDataManager
        self.unitDataManager = unitDataManager
        self.roaster = roaster
    }

    // MARK: - Public Functions

    func getRoasterDetails(roasterId: Int) {
        getRoasterById(roasterId: roasterId)
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

    func roasterDidReceiveDetachmentUpdate(detachment: DetachmentResponse) {
        getRoasterById(roasterId: roaster.id)
    }

    // MARK: - Private Functions

    private func getRoasterById(roasterId: Int) {
        roasterDataManager.getRoaster(byRoasterId: roasterId) { [weak self] (roaster, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let roaster = roaster {
                self?.presenter.didReceiveRoaster(roaster: roaster)
            }
        }
    }
}
