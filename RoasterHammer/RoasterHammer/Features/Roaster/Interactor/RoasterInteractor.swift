//
//  RoasterInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class RoasterInteractor: RoasterViewOutput {
    var presenter: RoasterInteractorOutput!
    let roasterDataManager: RoasterDataManager
    let unitDataManager: UnitDataManager

    init(roasterDataManager: RoasterDataManager, unitDataManager: UnitDataManager) {
        self.roasterDataManager = roasterDataManager
        self.unitDataManager = unitDataManager
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
