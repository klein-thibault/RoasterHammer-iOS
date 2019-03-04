//
//  DetachmentTypeInteractorOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol DetachmentTypeInteractorOutput {
    func didReceiveError(error: Error)
    func didReceiveDetachmentTypes(detachmentTypes: [DetachmentShortResponse])
    func didCreateNewDetachmentInRoaster(roaster: RoasterResponse)
}
