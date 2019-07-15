//
//  FeatureFactory.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol FeatureFactory {
    func accountBuilder() -> AccountBuildable
    func roastersBuilder() -> RoastersBuildable
    func roasterBuilder() -> RoasterBuildable
    func editUnitBuilder() -> EditUnitBuildable
    func editModelBuildable() -> EditModelBuildable
    func armiesBuilder() -> ArmiesBuildable
    func detachmentTypeBuilder() -> DetachmentTypeBuildable
    func unitsBuilder() -> UnitsBuildable
    func roasterViewerBuilder() -> RoasterViewerBuildable
}
