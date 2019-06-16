//
//  RoasterHammerEnvironmentManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class RoasterHammerEnvironmentManager: HTTPEnvironmentManager {
    var currentEnvironment: HTTPEnvironment
    var environments: [HTTPEnvironment]

    init(currentEnvironment: HTTPEnvironment, environments: [HTTPEnvironment]) {
        self.currentEnvironment = currentEnvironment
        self.environments = environments
    }
}
