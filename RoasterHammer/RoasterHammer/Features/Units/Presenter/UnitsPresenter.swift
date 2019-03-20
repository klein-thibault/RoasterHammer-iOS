//
//  UnitsPresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class UnitsPresenter: UnitsInteractorOutput {
    weak var view: UnitsView!

    func didReceiveUnits(_ units: [UnitResponse]) {
        view.didReceiveUnits(units)
    }

    func didUpdateDetachment(_ detachment: DetachmentResponse) {
        view.didUpdateDetachment(detachment)
    }

    func didReceiveError(_ error: Error) {
        view.didReceiveError(error)
    }
}
