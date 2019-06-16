//
//  EditUnitView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

protocol EditUnitView: class {
    func didReceiveSelectedUnit(unit: SelectedUnitResponse)
    func didReceiveError(error: Error)
}
