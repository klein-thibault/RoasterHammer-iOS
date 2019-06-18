//
//  DetachmentResponse+Utils.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/18/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

extension DetachmentResponse {
    var totalUnits: Int {
        roles.reduce(0) { $0 + $1.units.count }
    }
}
