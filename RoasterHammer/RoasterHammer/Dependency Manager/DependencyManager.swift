//
//  DependencyManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol DependencyManager: FeatureFactory {
    func startApplication(window: UIWindow?)
}
