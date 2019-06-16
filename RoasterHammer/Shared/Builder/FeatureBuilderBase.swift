//
//  FeatureBuilderBase.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

class FeatureBuilderBase {
    unowned var dependencyManager: DependencyManager

    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }
}
