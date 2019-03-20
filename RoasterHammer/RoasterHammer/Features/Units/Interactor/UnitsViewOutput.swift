//
//  UnitsViewOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol UnitsViewOutput {
    func getUnits()
    func addUnitToDetachment(unitId: Int, quantity: Int)
}
