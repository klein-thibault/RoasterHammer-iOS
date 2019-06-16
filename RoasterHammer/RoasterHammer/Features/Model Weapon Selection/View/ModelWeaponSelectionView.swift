//
//  ModelWeaponSelectionView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

protocol ModelWeaponSelectionView: class {
    func didReceiveSelectedUnit(unit: SelectedUnitResponse)
    func didReceiveError(error: Error)
}
