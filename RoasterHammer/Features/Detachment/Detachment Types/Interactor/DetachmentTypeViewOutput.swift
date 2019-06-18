//
//  DetachmentTypeViewOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

protocol DetachmentTypeViewOutput {
    func getDetachmentTypes()
    func createDetachment(ofType type: DetachmentShortResponse, forRoster rosterData: RoasterInteractor)
}
