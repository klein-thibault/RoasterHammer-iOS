//
//  UnitsInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class UnitsInteractor: UnitsViewOutput {
    var presenter: UnitsInteractorOutput!
    private let unitDataManager: UnitDataManager
    private let filters: UnitFilters
    private let detachmentId: Int
    private let unitRoleId: Int

    init(unitDataManager: UnitDataManager,
         filters: UnitFilters,
         detachmentId: Int,
         unitRoleId: Int) {
        self.unitDataManager = unitDataManager
        self.filters = filters
        self.detachmentId = detachmentId
        self.unitRoleId = unitRoleId
    }

    func getUnits() {
        unitDataManager.getUnits(withFilters: filters) { [weak self] (units, error) in
            if let error = error {
                self?.presenter.didReceiveError(error)
            } else if let units = units {
                self?.presenter.didReceiveUnits(units)
            }
        }
    }

    func addUnitToDetachment(unitId: Int, quantity: Int) {
        unitDataManager.addUnitToDetachment(detachmentId: detachmentId,
                                            unitRoleId: unitRoleId,
                                            unitId: unitId,
                                            quantity: quantity) { [weak self] (detachment, error) in
                                                if let error = error {
                                                    self?.presenter.didReceiveError(error)
                                                } else if let detachment = detachment {
                                                    self?.presenter.didUpdateDetachment(detachment)
                                                }
        }
    }
}
