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

    init() {
        let localEnvironment = HTTPEnvironment(name: "Local", baseURL: URL(string: "http://localhost:8080")!)
        environmentManager = RoasterHammerEnvironmentManager(currentEnvironment: localEnvironment, environments: [localEnvironment])
    }

    // MARK: - DependencyManager

    func startApplication(window: UIWindow?) {
        let roastersViewController = RoasterHammerDependencyManager().roastersBuilder().build()
        let navigationController = UINavigationController(rootViewController: roastersViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    // MARK: - FeatureFactory

    func loginBuilder() -> LoginBuildable {
        return LoginBuilder(dependencyManager: self)
    }

    func createAccountBuilder() -> CreateAccountBuildable {
        return CreateAccountBuilder(dependencyManager: self)
    }

    func roastersBuilder() -> RoastersBuildable {
        return RoastersBuilder(dependencyManager: self)
    }
}
