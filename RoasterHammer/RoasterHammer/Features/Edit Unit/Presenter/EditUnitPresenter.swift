//
//  EditUnitPresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class EditUnitPresenter: EditUnitInteractorOutput {
    weak var view: EditUnitView!

    func didReceiveSelectedUnit(unit: SelectedUnitResponse) {
        view.didReceiveSelectedUnit(unit: unit)
    }

    func didReceiveError(error: Error) {
        view.didReceiveError(error: error)
    }
}
