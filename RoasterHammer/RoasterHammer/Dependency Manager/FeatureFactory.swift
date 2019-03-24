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
    func accountBuilder() -> AccountBuildable
    func createAccountBuilder() -> CreateAccountBuildable
    func roastersBuilder() -> RoastersBuildable
    func roasterBuilder() -> RoasterBuildable
    func armiesBuilder() -> ArmiesBuildable
    func detachmentTypeBuilder() -> DetachmentTypeBuildable
    func unitsBuilder() -> UnitsBuildable
    func editUnitBuilder() -> EditUnitBuildable
}
