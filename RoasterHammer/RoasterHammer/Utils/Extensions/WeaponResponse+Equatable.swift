//
//  WeaponResponse+Equatable.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

extension WeaponResponse: Equatable {
    public static func == (lhs: WeaponResponse, rhs: WeaponResponse) -> Bool {
        return lhs.name == rhs.name &&
            lhs.range == rhs.range &&
            lhs.type == rhs.type &&
            lhs.strength == rhs.strength &&
            lhs.armorPiercing == rhs.armorPiercing &&
            lhs.damage == rhs.damage &&
            lhs.cost == rhs.cost &&
            lhs.ability == rhs.ability
    }
}
