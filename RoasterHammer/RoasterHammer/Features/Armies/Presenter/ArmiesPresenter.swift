//
//  ArmiesPresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class ArmiesPresenter: ArmiesInteractorOutput {
    weak var view: ArmiesView!

    func didReceiveArmies(armies: [ArmyResponse]) {
        view.didReceiveArmies(armies: armies)
    }

    func didReceiveError(error: Error) {
        view.didReceiveError(error: error)
    }
}
