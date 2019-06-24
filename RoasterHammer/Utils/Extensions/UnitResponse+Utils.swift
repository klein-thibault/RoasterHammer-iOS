//
//  UnitResponse+Utils.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/23/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

extension UnitResponse {
    var isPsycher: Bool {
        return keywords
            .map { $0.lowercased() }
            .contains { $0 == "psycher"}
    }
}
