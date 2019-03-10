//
//  UnitsInteractorOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol UnitsInteractorOutput {
    func didReceiveUnits(_ units: [UnitResponse])
    func didReceiveError(_ error: Error)
}
