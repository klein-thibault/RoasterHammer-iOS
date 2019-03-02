//
//  FeatureFactory.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol FeatureFactory {
    func loginBuilder() -> LoginBuildable
    func createAccountBuilder() -> CreateAccountBuildable
    func roastersBuilder() -> RoastersBuildable
    func roasterBuilder() -> RoasterBuildable
}
