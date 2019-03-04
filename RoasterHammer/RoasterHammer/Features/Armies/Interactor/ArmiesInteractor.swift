//
//  ArmiesInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class ArmiesInteractor: ArmiesViewOutput {
    var presenter: ArmiesInteractorOutput!
    private let armyDataManager: ArmyDataManager

    init(armyDataManager: ArmyDataManager) {
        self.armyDataManager = armyDataManager
    }

    func getArmies() {
        armyDataManager.getArmies { [weak self] (armies, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let armies = armies {
                self?.presenter.didReceiveArmies(armies: armies)
            }
        }
    }
}
