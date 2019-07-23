//
//  UnitsInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RoasterHammer_Shared

final class UnitsInteractor: UnitsViewOutput, BindableObject {
    var units: [UnitResponse] = [] {
        didSet {
            willChange.send(self)
        }
    }
    let detachmentId: Int
    let unitRoleId: Int
    var willChange = PassthroughSubject<UnitsInteractor, Never>()

    private let unitDataManager: UnitDataManager
    private let filters: UnitFilters

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
            if let units = units {
                self?.units = units
            }
        }
    }
}
