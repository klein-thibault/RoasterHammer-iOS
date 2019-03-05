//
//  DetachmentTypeViewOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol DetachmentTypeViewOutput {
    func getDetachmentTypes()
    func createDetachment(ofType type: DetachmentShortResponse,
                          forRoaster roaster: RoasterResponse,
                          inArmy armyId: Int)
}
