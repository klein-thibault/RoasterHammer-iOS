//
//  EditUnitInteractorOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol EditUnitInteractorOutput {
    func didReceiveSelectedUnit(unit: SelectedUnitResponse)
    func didReceiveError(error: Error)
}
