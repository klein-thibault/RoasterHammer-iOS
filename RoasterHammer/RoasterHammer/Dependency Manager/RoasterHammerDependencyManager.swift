//
//  RoasterHammerDependencyManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class RoasterHammerDependencyManager: DependencyManager {
    func loginBuilder() -> LoginBuildable {
        return LoginBuilder()
    }
}
