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

    // MARK: - DependencyManager

    func startApplication(window: UIWindow?) {
        let roastersViewController = RoasterHammerDependencyManager().roastersBuilder().build()
        let navigationController = UINavigationController(rootViewController: roastersViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    // MARK: - FeatureFactory

    func loginBuilder() -> LoginBuildable {
        return LoginBuilder()
    }

    func createAccountBuilder() -> CreateAccountBuildable {
        return CreateAccountBuilder()
    }

    func roastersBuilder() -> RoastersBuildable {
        return RoastersBuilder()
    }
}
