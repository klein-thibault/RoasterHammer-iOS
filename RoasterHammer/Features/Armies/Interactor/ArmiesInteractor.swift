//
//  ArmiesInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RoasterHammer_Shared

final class ArmiesInteractor: ArmiesViewOutput, BindableObject {
    var armies: [ArmyResponse] = [] {
        didSet {
            willChange.send(self)
        }
    }

    private let armyDataManager: ArmyDataManager

    var willChange = PassthroughSubject<ArmiesInteractor, Never>()

    init(armyDataManager: ArmyDataManager) {
        self.armyDataManager = armyDataManager
    }

    func getArmies() {
        armyDataManager.getArmies { [weak self] (armies, error) in
            if let armies = armies {
                self?.armies = armies
            }
        }
    }
}
