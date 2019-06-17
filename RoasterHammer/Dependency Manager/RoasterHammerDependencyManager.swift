//
//  RoasterHammerDependencyManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class RoasterHammerDependencyManager: DependencyManager {
    var environmentManager: HTTPEnvironmentManager
    static let shared = RoasterHammerDependencyManager()

    init() {
        let localEnvironment = HTTPEnvironment(name: "Local", baseURL: URL(string: "http://localhost:8080")!)
        environmentManager = RoasterHammerEnvironmentManager(currentEnvironment: localEnvironment, environments: [localEnvironment])
    }

    // MARK: - DependencyManager

    func startApplication() { }

    // MARK: - FeatureFactory

    func loginBuilder() -> LoginBuildable {
        return LoginBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func accountBuilder() -> AccountBuildable {
        return AccountBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func createAccountBuilder() -> CreateAccountBuildable {
        return CreateAccountBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func roastersBuilder() -> RoastersBuildable {
        return RoastersBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func roasterBuilder() -> RoasterBuildable {
        return RoasterBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func armiesBuilder() -> ArmiesBuildable {
        return ArmiesBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func detachmentTypeBuilder() -> DetachmentTypeBuildable {
        return DetachmentTypeBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func unitsBuilder() -> UnitsBuildable {
        return UnitsBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func editUnitBuilder() -> EditUnitBuildable {
        return EditUnitBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func modelWeaponSelectionBuilder() -> ModelWeaponSelectionBuildable {
        return ModelWeaponSelectionBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

    func roasterViewerBuilder() -> RoasterViewerBuildable {
        return RoasterViewerBuilder(dependencyManager: RoasterHammerDependencyManager.shared)
    }

}
