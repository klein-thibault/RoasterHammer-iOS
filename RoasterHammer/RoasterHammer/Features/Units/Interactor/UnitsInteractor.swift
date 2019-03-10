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

    init(unitDataManager: UnitDataManager) {
        self.unitDataManager = unitDataManager
    }

    func getUnits(withFilters filters: UnitFilters) {
        unitDataManager.getUnits(withFilters: filters) { [weak self] (units, error) in
            if let error = error {
                self?.presenter.didReceiveError(error)
            } else if let units = units {
                self?.presenter.didReceiveUnits(units)
            }
        }
    }
}
