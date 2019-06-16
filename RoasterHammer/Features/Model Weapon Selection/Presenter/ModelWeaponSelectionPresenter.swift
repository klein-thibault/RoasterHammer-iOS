//
//  ModelWeaponSelectionPresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

final class ModelWeaponSelectionPresenter: ModelWeaponSelectionInteractorOutput {
    weak var view: ModelWeaponSelectionView!

    func didReceiveSelectedUnit(unit: SelectedUnitResponse) {
        view.didReceiveSelectedUnit(unit: unit)
    }

    func didReceiveError(error: Error) {
        view.didReceiveError(error: error)
    }
}
